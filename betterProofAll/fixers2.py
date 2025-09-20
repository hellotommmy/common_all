import os
import sys
import re
import subprocess
import posixpath
import shutil

deepIsaHOL_path = "~/Documents/GitHub/DeepIsaHOL/src/main/ml/"
BaseProof_path = " ~/Documents/GitHub/betterProof/Common/"

# Intermediate step:
# For each .thy file in read_dir (as many as n), it creates a new directory in output_dir
# In each new directory, it writes a ROOT file and a single .thy file
# The objective is to use `isabelle build` on the generated .thy for launching fixer.ML utils
def create_fixer_thys(read_dir, output_dir, n):
    # Get all .thy files in the read directory (non-recursively) and sort them
    thy_files = sorted([f for f in os.listdir(read_dir) if f.endswith('.thy')])
    
    # Limit to the first n files
    thy_files = thy_files if n < 0 else thy_files[:n]

    for thy_file in thy_files:
        thy_file_path = os.path.join(read_dir, thy_file)
        thy_file_name = os.path.splitext(thy_file)[0] # removing extension .thy
        
        # Create a new directory in the output directory named after the thy_file
        new_dir = os.path.join(output_dir, thy_file_name)
        os.makedirs(new_dir, exist_ok=True)
        
        # Create a new .thy file in the new directory with the name of the original thy_file
        new_thy_file_path = os.path.join(new_dir, thy_file)
        with open(new_thy_file_path, 'w') as new_thy_file:
            with open(thy_file_path, 'r') as original_thy_file:
                content = original_thy_file.read()
                
                # Extract and modify the header
                header_match = re.search(r'theory\s+\S+\s+imports\s+(.+?)\s+begin', content, re.DOTALL)
                if header_match:
                    imports = header_match.group(1).strip().split()
                    modified_imports = ' '.join(f'BaseProofAll.{imp}' for imp in imports)
                    new_header = f'theory {thy_file_name}\n  imports {modified_imports} BaseProofAll.Fixer\nbegin\n'
                    new_thy_file.write(new_header)

                # Add the ML code block after the modified header
                new_thy_file.write(f'\nML \\<open>\nval _ = Fixer.fix_end_to_end \\<^theory> "{thy_file_path}" "{os.path.basename(thy_file_path)}" "{output_dir}"\n\\<close>\n\nend\n')

        # Create the ROOT file in the new directory
        root_file_path = os.path.join(new_dir, 'ROOT')
        with open(root_file_path, 'w') as root_file:
            root_file.write(f'session "Temp" = BaseProofAll +\n')
            root_file.write(f'  options [document = false]\n')
            root_file.write(f'  theories\n')
            root_file.write(f'    {thy_file_name}\n')


def create_fixer_thys_win(read_dir, output_dir, n, abs_dir):
    # Get all .thy files in the read directory (non-recursively) and sort them
    thy_files = sorted([f for f in os.listdir(read_dir) if f.endswith('.thy')])
    
    # Limit to the first n files
    thy_files = thy_files if n < 0 else thy_files[:n]

    for thy_file in thy_files:
        thy_file_path = os.path.join(read_dir, thy_file)
        thy_file_name = os.path.splitext(thy_file)[0] # removing extension .thy
        
        # Create a new directory in the output directory named after the thy_file
        new_dir = os.path.join(output_dir, thy_file_name)
        os.makedirs(new_dir, exist_ok=True)
        
        # Create a new .thy file in the new directory with the name of the original thy_file
        new_thy_file_path = os.path.join(new_dir, thy_file)
        with open(new_thy_file_path, 'w') as new_thy_file:
            with open(thy_file_path, 'r') as original_thy_file:
                content = original_thy_file.read()
                
                # Extract and modify the header
                header_match = re.search(r'theory\s+\S+\s+imports\s+(.+?)\s+begin', content, re.DOTALL)
                if header_match:
                    imports = header_match.group(1).strip().split()
                    modified_imports_list = []
                    for imp in imports:
                        if imp.startswith('BaseProofAll.'):
                            modified_imports_list.append(imp[10:])
                        else:
                            modified_imports_list.append(imp)
                    modified_imports = ' '.join(f'BaseProofAll.{imp}' for imp in modified_imports_list)
                    new_header = f'theory {thy_file_name}\n  imports {modified_imports} BaseProofAll.Fixer\nbegin\n'
                    new_thy_file.write(new_header)

                # Add the ML code block after the modified header
                new_thy_file.write(f'\nML \\<open>\nval _ = Fixer.fix_end_to_end \\<^theory> "{thy_file_path}" "{os.path.basename(thy_file_path)}" "{output_dir}"\n\\<close>\n\nend\n')

        # Create the ROOT file in the new directory
        root_file_path = os.path.join(new_dir, 'ROOT')
        with open(root_file_path, 'w') as root_file:
            root_file.write(f'session "Temp" = BaseProofAll +\n')
            root_file.write(f'  options [document = false]\n')
            root_file.write(f'  theories\n')
            root_file.write(f'    {thy_file_name}\n')


def delete_spurious_folders(read_dir, output_dir, n):
    # Get all .thy files in the read directory (non-recursively) and sort them
    thy_files = sorted([f for f in os.listdir(read_dir) if f.endswith('.thy')])
    
    # Limit to the first n files
    thy_files = thy_files if n < 0 else thy_files[:n]

    for thy_file in thy_files:
        thy_file_name = os.path.splitext(thy_file)[0] # removing extension .thy
        
        new_dir = os.path.join(output_dir, thy_file_name)
        shutil.rmtree(new_dir, ignore_errors=True)


# Uses `isabelle build` on work_dir's immediate subdirectories 
# The subdirectories must start with "Fix", have a ROOT file and contain a single .thy file
def build_fixer_thys(work_dir):
    log_file_path = os.path.join(work_dir, "isabelle_build_log.txt")
    errors = []

    # Iterate through immediate subdirectories in work_dir
    for dir_name in os.listdir(work_dir):
        dir_path = posixpath.join(work_dir, dir_name)
        # If it’s a directory starting with 'Fix' and contains both a ROOT file and one .thy file
        if os.path.isdir(dir_path) and dir_name.startswith("Fix"):
            root_file = os.path.join(dir_path, "ROOT")
            thy_files = [f for f in os.listdir(dir_path) if f.endswith(".thy")]
            if os.path.isfile(root_file) and len(thy_files) == 1:
                try:
                    # Construct the Isabelle command
                    command = [
                        "isabelle", "build", "-v",
                        "-D", deepIsaHOL_path,
                        "-D", BaseProof_path,
                        "-D", dir_path
                    ]
                    
                    # Run the Isabelle command
                    result = subprocess.run(command, check=True, text=True, capture_output=True)
                    
                    # Log success if no errors
                    with open(log_file_path, "a") as log_file:
                        log_file.write(f"Messages for {dir_name}:\n")
                        log_file.write(result.stdout + "\n")

                except subprocess.CalledProcessError as e:
                    # Append errors to the log
                    errors.append(f"ERROR in {dir_name}: {e.stderr}")
                    with open(log_file_path, "a") as log_file:
                        log_file.write(f"ERROR in {dir_name}: {e.stderr}\n")

    if errors:
        print(f"Errors found: {', '.join(errors)}")
    else:
        print("All builds completed successfully.")


# For the Windows version, we will create a bash script with the Isabelle build command 
# and then run that script from Python.
def build_fixer_thys_win(work_dir, abs_dir):
    log_file_path = os.path.join(work_dir, "isabelle_build_log.txt")
    errors = []

    # Create a bash script that we will run
    build_script_path = os.path.join(abs_dir, "build_script.sh")
    # Make sure we start fresh
    if os.path.exists(build_script_path):
        os.remove(build_script_path)

    with open(build_script_path, "w") as script_file:
        script_file.write("#!/usr/bin/env bash\n\n")

        # Iterate through immediate subdirectories in work_dir
        for dir_name in os.listdir(work_dir):
            dir_path = posixpath.join(work_dir, dir_name)
            # If it’s a directory starting with 'Fix' and contains both a ROOT file and one .thy file
            if os.path.isdir(dir_path) and dir_name.startswith("Fix"):
                root_file = os.path.join(dir_path, "ROOT")
                thy_files = [f for f in os.listdir(dir_path) if f.endswith(".thy")]
                abs_dir_path = posixpath.join(abs_dir, dir_name)
                if os.path.isfile(root_file) and len(thy_files) == 1:
                    # Construct the Isabelle command and write it to the script
                    command = (
                        f"isabelle build -v "
                        f"-D {deepIsaHOL_path} "
                        f"-D {BaseProof_path} "
                        f"-D {abs_dir_path}"
                    )
                    script_file.write(command)

    # Now run the script
    # We'll capture the output and errors by redirecting them in the subprocess call
    try:
        result = subprocess.run(["bash", build_script_path], check=True, text=True, capture_output=True)
        # Log success if no errors
        with open(log_file_path, "a") as log_file:
            log_file.write("Messages from build_script:\n")
            log_file.write(result.stdout + "\n")

    except subprocess.CalledProcessError as e:
        # Append errors to the log
        errors.append(f"ERROR in build_script: {e.stderr}")
        with open(log_file_path, "a") as log_file:
            log_file.write(f"ERROR in build_script: {e.stderr}\n")

    if errors:
        print(f"Errors found: {', '.join(errors)}")
    else:
        print("All builds completed successfully.")


if __name__ == "__main__":
    if len(sys.argv) == 4:
        # Linux mode
        read_dir = sys.argv[1]
        output_dir = sys.argv[2]
        n = int(sys.argv[3])
        delete_spurious_folders(read_dir, output_dir, n)
        create_fixer_thys(read_dir, output_dir, n)
        build_fixer_thys(output_dir)
    elif len(sys.argv) == 5:
        # Windows mode
        read_dir = sys.argv[1]
        output_dir = sys.argv[2]
        n = int(sys.argv[3])
        windows_dir = sys.argv[4]
        delete_spurious_folders(read_dir, output_dir, n)
        create_fixer_thys_win(read_dir, output_dir, n, windows_dir)
        build_fixer_thys_win(output_dir, windows_dir)
    else:
        print("Usage for Linux: python fixers.py <read_dir> <output_dir> <n=number-of-files-(negative-means-all)>")
        print("Usage for windows: python fixers.py <read_dir> <output_dir> <n=number-of-files-(negative-means-all)> <abs_dir=absolute-path-for-windows>")
