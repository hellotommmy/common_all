#!/usr/bin/env python3
"""
Simple fix for line number offsets in SWMR_modification_progress.py
OldCohProp.thy line 200 corresponds to CoherenceProperties.thy line 317
So we need to add 117 to all current_line numbers
"""

# Read the file
with open('SWMR_modification_progress.py', 'r', encoding='utf-8') as f:
    lines = f.readlines()

# Process each line
new_lines = []
for line in lines:
    if line.strip().startswith('[') and ', ' in line and line.strip().endswith('],'):
        # This is a progress entry line
        # Extract the first number (current_line) and add 117
        try:
            # Find the first number in brackets
            start = line.find('[') + 1
            comma = line.find(',', start)
            if comma > start:
                current_line = int(line[start:comma].strip())
                new_current_line = current_line + 117
                # Replace the number
                new_line = line[:start] + str(new_current_line) + line[comma:]
                new_lines.append(new_line)
            else:
                new_lines.append(line)
        except:
            new_lines.append(line)
    else:
        new_lines.append(line)

# Write back
with open('SWMR_modification_progress.py', 'w', encoding='utf-8') as f:
    f.writelines(new_lines)

print("Fixed line number offsets by adding 117 to all current_line numbers")
