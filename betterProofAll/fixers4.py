import os
import sys
import re
import subprocess
import posixpath
import shutil
import sys

deepIsaHOL_path = "~/Documents/GitHub/DeepIsaHOL/src/main/ml/"
BaseProof_path = " ~/Documents/GitHub/betterProof/Common/"

def create_fixer_thys(read_dir, output_dir, n):
    thy_files = sorted([f for f in os.listdir(read_dir) if f.endswith('.thy')])
    thy_files = thy_files if n < 0 else thy_files[:n]

    for thy_file in thy_files:
        thy_file_path = os.path.join(read_dir, thy_file)
        thy_file_name = os.path.splitext(thy_file)[0]
        
        new_dir = os.path.join(output_dir, thy_file_name)
        os.makedirs(new_dir, exist_ok=True)
        
        new_thy_file_path = os.path.join(new_dir, thy_file)
        with open(new_thy_file_path, 'w', newline='\n') as new_thy_file:
            with open(thy_file_path, 'r', newline='') as original_thy_file:
                content = original_thy_file.read()
                
                header_match = re.search(r'theory\s+\S+\s+imports\s+(.+?)\s+begin', content, re.DOTALL)
                if header_match:
                    imports = header_match.group(1).strip().split()
                    modified_imports = ' '.join(f'BaseProofAll.{imp}' for imp in imports)
                    new_header = f'theory {thy_file_name}\n  imports {modified_imports} BaseProofAll.Fixer\nbegin\n'
                    new_thy_file.write(new_header)

                new_thy_file.write(f'\nML \\<open>\nval _ = Fixer.fix_end_to_end \\<^theory> "{thy_file_path}" "{os.path.basename(thy_file_path)}" "{output_dir}"\n\\<close>\n\nend\n')

        root_file_path = os.path.join(new_dir, 'ROOT')
        with open(root_file_path, 'w', newline='\n') as root_file:
            root_file.write('session "Temp" = BaseProofAll +\n')
            root_file.write('  options [document = false]\n')
            root_file.write('  theories\n')
            root_file.write(f'    {thy_file_name}\n')


def create_fixer_thys_win(read_dir, output_dir, n, abs_dir):
    thy_files = sorted([f for f in os.listdir(read_dir) if f.endswith('.thy')])
    thy_files = thy_files if n < 0 else thy_files[:n]

    for thy_file in thy_files:
        thy_file_path = os.path.join(read_dir, thy_file)
        thy_file_name = os.path.splitext(thy_file)[0]
        
        new_dir = os.path.join(output_dir, thy_file_name)
        os.makedirs(new_dir, exist_ok=True)
        
        new_thy_file_path = os.path.join(new_dir, thy_file)
        with open(new_thy_file_path, 'w', newline='\n') as new_thy_file:
            with open(thy_file_path, 'r', newline='') as original_thy_file:
                content = original_thy_file.read()
                
                header_match = re.search(r'theory\s+\S+\s+imports\s+(.+?)\s+begin', content, re.DOTALL)
                if header_match:
                    imports = header_match.group(1).strip().split()
                    modified_imports = ' '.join(f'BaseProofAll.{imp}' for imp in imports)
                    new_header = f'theory {thy_file_name}\n  imports {modified_imports} BaseProofAll.Fixer\nbegin\n'
                    new_thy_file.write(new_header)

                new_thy_file.write(f'\nML \\<open>\nval _ = Fixer.fix_end_to_end \\<^theory> "{thy_file_path}" "{os.path.basename(thy_file_path)}" "{output_dir}"\n\\<close>\n\nend\n')

        root_file_path = os.path.join(new_dir, 'ROOT')
        with open(root_file_path, 'w', newline='\n') as root_file:
            root_file.write('session "Temp" = BaseProofAll +\n')
            root_file.write('  options [document = false]\n')
            root_file.write('  theories\n')
            root_file.write(f'    {thy_file_name}\n')


def delete_spurious_folders(read_dir, output_dir, n):
    thy_files = sorted([f for f in os.listdir(read_dir) if f.endswith('.thy')])
    thy_files = thy_files if n < 0 else thy_files[:n]

    for thy_file in thy_files:
        thy_file_name = os.path.splitext(thy_file)[0]
        new_dir = os.path.join(output_dir, thy_file_name)
        shutil.rmtree(new_dir, ignore_errors=True)


def build_fixer_thys(work_dir):
    log_file_path = os.path.join(work_dir, "isabelle_build_log.txt")
    errors = []

    for dir_name in os.listdir(work_dir):
        dir_path = posixpath.join(work_dir, dir_name)
        if os.path.isdir(dir_path) and dir_name.startswith("Fix"):
            root_file = os.path.join(dir_path, "ROOT")
            thy_files = [f for f in os.listdir(dir_path) if f.endswith(".thy")]
            if os.path.isfile(root_file) and len(thy_files) == 1:
                command = [
                    "isabelle", "build", "-v",
                    "-D", deepIsaHOL_path,
                    "-D", BaseProof_path,
                    "-D", dir_path
                ]
                
                print(f"Running: {' '.join(command)}")
                try:
                    result = subprocess.run(command, check=True, text=True, stdout=sys.stdout, stderr=sys.stderr)
                    with open(log_file_path, "a", newline='\n') as log_file:
                        log_file.write(f"Messages for {dir_name}:\n")
                except subprocess.CalledProcessError as e:
                    errors.append(f"ERROR in {dir_name}: {e}")
                    with open(log_file_path, "a", newline='\n') as log_file:
                        log_file.write(f"ERROR in {dir_name}: {e}\n")

    if errors:
        print(f"Errors found: {', '.join(errors)}")
    else:
        print("All builds completed successfully.")


def build_fixer_thys_win(work_dir, abs_dir):
    log_file_path = os.path.join(work_dir, "isabelle_build_log.txt")
    errors = []

    for dir_name in os.listdir(work_dir):
        dir_path = posixpath.join(work_dir, dir_name)
        if os.path.isdir(dir_path) and dir_name.startswith("Fix"):
            root_file = os.path.join(dir_path, "ROOT")
            thy_files = [f for f in os.listdir(dir_path) if f.endswith(".thy")]
            if os.path.isfile(root_file) and len(thy_files) == 1:
                abs_dir_path = posixpath.join(abs_dir, dir_name)
                command_line = (
                    f"isabelle build -v "
                    f"-D {deepIsaHOL_path} "
                    f"-D {BaseProof_path} "
                    f"-D {abs_dir_path}"
                )

                script_name = f"build_script_{dir_name}.sh"
                script_path = os.path.join(abs_dir, script_name)

                with open(script_path, "w", newline='\n') as script_file:
                    script_file.write("#!/usr/bin/env bash\n")
                    script_file.write(command_line + "\n")

                # Remove carriage returns globally, if any
                subprocess.run(["sed", "-i", 's/\r//g', script_path], check=True)

                print(f"Running bash {script_path}")
                try:
                    result = subprocess.run(["bash", script_path], check=True, text=True, stdout=sys.stdout, stderr=sys.stderr)
                    with open(log_file_path, "a", newline='\n') as log_file:
                        log_file.write(f"Messages for {dir_name}:\n")
                except subprocess.CalledProcessError as e:
                    errors.append(f"ERROR in {dir_name}: {e}")
                    with open(log_file_path, "a", newline='\n') as log_file:
                        log_file.write(f"ERROR in {dir_name}: {e}\n")

                # If desired, remove the script
                # os.remove(script_path)

    if errors:
        print(f"Errors found: {', '.join(errors)}")
    else:
        print("All builds completed successfully.")


if __name__ == "__main__":
    if len(sys.argv) == 4:
        read_dir = sys.argv[1]
        output_dir = sys.argv[2]
        n = int(sys.argv[3])
        delete_spurious_folders(read_dir, output_dir, n)
        create_fixer_thys(read_dir, output_dir, n)
        build_fixer_thys(output_dir)
    elif len(sys.argv) == 5:
        read_dir = sys.argv[1]
        output_dir = sys.argv[2]
        n = int(sys.argv[3])
        windows_dir = sys.argv[4]

        # Strip trailing whitespace or newlines from directories if any
        output_dir = output_dir.strip()
        windows_dir = windows_dir.strip()

        delete_spurious_folders(read_dir, output_dir, n)
        create_fixer_thys_win(read_dir, output_dir, n, windows_dir)
        build_fixer_thys_win(output_dir, windows_dir)
    else:
        print("Usage for Linux: python fixers.py <read_dir> <output_dir> <n=number-of-files-(negative-means-all)>")
        print("Usage for Windows: python fixers.py <read_dir> <output_dir> <n=number-of-files-(negative-means-all)> <abs_dir=absolute-path-for-windows>")
