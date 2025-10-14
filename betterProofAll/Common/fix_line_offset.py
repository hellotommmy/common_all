#!/usr/bin/env python3
"""
Fix line number offsets in SWMR_modification_progress.py
The offset is 117 lines (CoherenceProperties.thy line 317 corresponds to OldCohProp.thy line 200)
"""

def fix_progress_offsets():
    # Read the current progress file
    with open('SWMR_modification_progress.py', 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Extract the progress list
    import re
    
    # Find the progress list
    progress_match = re.search(r'progress = \[(.*?)\]', content, re.DOTALL)
    if not progress_match:
        print("Could not find progress list")
        return
    
    progress_content = progress_match.group(1)
    
    # Parse each line entry
    lines = []
    for line in progress_content.split('\n'):
        line = line.strip()
        if line.startswith('[') and line.endswith('],'):
            # Parse the entry: [current_line, status, original_line, description]
            try:
                # Remove brackets and trailing comma
                line_content = line[1:-2]
                parts = []
                current_part = ""
                in_quotes = False
                bracket_count = 0
                
                for char in line_content:
                    if char == '"' and (not current_part or current_part[-1] != '\\'):
                        in_quotes = not in_quotes
                    elif char == '[' and not in_quotes:
                        bracket_count += 1
                    elif char == ']' and not in_quotes:
                        bracket_count -= 1
                    elif char == ',' and not in_quotes and bracket_count == 0:
                        parts.append(current_part.strip())
                        current_part = ""
                        continue
                    
                    current_part += char
                
                if current_part.strip():
                    parts.append(current_part.strip())
                
                if len(parts) >= 4:
                    current_line = int(parts[0])
                    status = parts[1].strip("'\"")
                    
                    # Handle original_line - might be int or string
                    original_line_str = parts[2].strip()
                    if original_line_str.isdigit():
                        original_line = int(original_line_str)
                    else:
                        original_line = original_line_str.strip("'\"")
                    
                    description = parts[3]
                    
                    # Apply offset correction: add 117 to current_line
                    corrected_current_line = current_line + 117
                    
                    lines.append([corrected_current_line, status, original_line, description])
                    
            except Exception as e:
                print(f"Error parsing line: {line}")
                print(f"Error: {e}")
                continue
    
    # Generate new progress content
    new_progress_lines = []
    for entry in lines:
        current_line, status, original_line, description = entry
        if isinstance(original_line, int):
            new_progress_lines.append(f"    [{current_line}, '{status}', {original_line}, {description}],")
        else:
            new_progress_lines.append(f"    [{current_line}, '{status}', '{original_line}', {description}],")
    
    # Replace the progress list in the content
    new_progress_content = "progress = [\n" + "\n".join(new_progress_lines) + "\n]"
    
    # Replace in the original content
    new_content = re.sub(r'progress = \[.*?\]', new_progress_content, content, flags=re.DOTALL)
    
    # Write back
    with open('SWMR_modification_progress.py', 'w', encoding='utf-8') as f:
        f.write(new_content)
    
    print(f"Fixed {len(lines)} entries with +117 line offset")
    print("Updated SWMR_modification_progress.py")

if __name__ == "__main__":
    fix_progress_offsets()
