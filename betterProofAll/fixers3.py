import os
import sys
import re
import subprocess
import posixpath
import shutil
import sys

deepIsaHOL_path = "~/Documents/GitHub/DeepIsaHOL/src/main/ml/"
BaseProof_path = " ~/Documents/GitHub/betterProof/Common/"




def create_fixer_thys_win(read_dir, output_dir, n, win_cyg_abs_dir, output_dir_for_isabelle):
    # Get all .thy files in the read directory (non-recursively) and sort them
    print(read_dir)
    thy_files = sorted([f for f in os.listdir(read_dir) if f.endswith('Filled.thy') and f.startswith('Fix')])
    print(read_dir)
    # print(os.listdir(read_dir))
    # Limit to the first n files
    thy_files = thy_files if n < 0 else thy_files[:n]
    # print(thy_files)
    # print(n)
    for thy_file in thy_files:
        print(f"processing thy file {thy_file}")
        thy_file_path = posixpath.join(read_dir, thy_file)
        relative_thy_file_path = thy_file_path.replace("C:/Users/Chengsong", "~")
        thy_file_name = os.path.splitext(thy_file)[0] # removing extension .thy
        
        # Create a new directory in the output directory named after the thy_file
        new_dir = posixpath.join(output_dir, thy_file_name)
        print(f"making dir {new_dir}")
        os.makedirs(new_dir, exist_ok=True)
        
        # Create a new .thy file in the new directory with the name of the original thy_file
        new_thy_file_path = os.path.join(new_dir, thy_file)
        with open(new_thy_file_path, 'w', newline='\n') as new_thy_file:
            with open(thy_file_path, 'r', newline='') as original_thy_file:
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
                new_thy_file.write(f'\nML \\<open>\nval _ = Fixer.fix_end_to_end \\<^theory> "{relative_thy_file_path}" "{os.path.basename(thy_file_path)}" "{output_dir_for_isabelle}"\n\\<close>\n\nend\n')

        # Create the ROOT file in the new directory
        root_file_path = os.path.join(new_dir, 'ROOT')
        with open(root_file_path, 'w', newline='\n') as root_file:
            root_file.write(f'session "Temp" = BaseProofAll +\n')
            root_file.write(f'  options [document = false]\n')
            root_file.write(f'  theories\n')
            root_file.write(f'    {thy_file_name}\n')


def delete_spurious_folders(read_dir, output_dir, n, output_dir_for_isabelle):
    # Get all .thy files in the read directory (non-recursively) and sort them
    thy_files = sorted([f for f in os.listdir(read_dir) if f.endswith('.thy')])
    
    # Limit to the first n files
    thy_files = thy_files if n < 0 else thy_files[:n]
    print(thy_files)
    for thy_file in thy_files:
        thy_file_name = os.path.splitext(thy_file)[0] # removing extension .thy
        
        new_dir = os.path.join(output_dir, thy_file_name)
        shutil.rmtree(new_dir, ignore_errors=True)


def build_fixer_thys_win(work_dir, win_cyg_abs_dir, bash_script_path):
    log_file_path = os.path.join(work_dir, "isabelle_build_log.txt")
    errors = []

    # Instead of one big script, create a script per directory and run them one by one
    for dir_name in os.listdir(work_dir):
        dir_path = posixpath.join(work_dir, dir_name)
        if os.path.isdir(dir_path) and dir_name.startswith("Fix") and dir_name.endswith("Filled"):
            root_file = os.path.join(dir_path, "ROOT")
            thy_files = [f for f in os.listdir(dir_path) if f.endswith(".thy")]
            if os.path.isfile(root_file) and len(thy_files) == 1:
                win_cyg_abs_dir_path = posixpath.join(win_cyg_abs_dir, dir_name)
                bash_path = posixpath.join(bash_script_path, dir_name)
                command_line = (
                    f"isabelle build -v "
                    f"-D {deepIsaHOL_path} "
                    f"-D {BaseProof_path} "
                    f"-D {bash_path}"
                )

                # Create a temporary script for this directory
                script_name = f"build_script_{dir_name}.sh"
                script_path = os.path.join(work_dir, script_name)

                with open(script_path, "w", newline='\n') as script_file:
                    script_file.write("#!/usr/bin/env bash\n")
                    script_file.write(command_line + "\n")

                # Convert to Unix format (if dos2unix is available)
                try:
                    subprocess.run(["dos2unix", script_path], check=True, text=True)
                except FileNotFoundError:
                    # dos2unix not available, ignore
                    print("dos2unix not run")
                    pass

                print(f"Running bash {script_path}")
                try:
                    result = subprocess.run(["bash", script_path], check=True, text=True, stdout=sys.stdout, stderr=sys.stderr)
                    with open(log_file_path, "a", newline='\n') as log_file:
                        log_file.write(f"Messages for {dir_name}:\n")
                except subprocess.CalledProcessError as e:
                    errors.append(f"ERROR in {dir_name}: {e}")
                    with open(log_file_path, "a", newline='\n') as log_file:
                        log_file.write(f"ERROR in {dir_name}: {e}\n")

                # Cleanup the script after running if desired
                # os.remove(script_path)

    if errors:
        print(f"Errors found: {', '.join(errors)}")
    else:
        print("All builds completed successfully.")


if __name__ == "__main__":
    if len(sys.argv) == 4:
        print("this does not support linux mode")
    elif len(sys.argv) == 7:
        # Windows mode
        read_dir = sys.argv[1]
        output_dir = sys.argv[2]
        n = int(sys.argv[3])
        win_cyg_abs_dir = sys.argv[4]
        output_dir_for_isabelle = sys.argv[5]
        print(sys.argv[1])
        print(sys.argv[2])
        print(sys.argv[4])
        print(sys.argv[5])
        bash_path = sys.argv[6]
        delete_spurious_folders(read_dir, output_dir, n, output_dir_for_isabelle)
        create_fixer_thys_win(read_dir, output_dir, n, win_cyg_abs_dir, output_dir_for_isabelle)
        build_fixer_thys_win(output_dir, win_cyg_abs_dir, bash_path)
    else:
        print("Usage for Linux: python fixers.py <read_dir> <output_dir> <n=number-of-files-(negative-means-all)>")
        print("Usage for windows: python fixers.py <read_dir> <output_dir> <n=number-of-files-(negative-means-all)> <win_cyg_abs_dir=absolute-path-for-windows-Isabelle-cygdrive-environment(input file)> <win_cyg_abs_dir=absolute-path-for-windows-Isabelle-cygdrive-environment(output file)> <bash_path=cygdrive-style-folder-to-store-bash-scripts>")
