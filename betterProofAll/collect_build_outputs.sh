#!/bin/bash

# Name of the output file
OUTPUT_FILE="info1.txt"

# Initialize the output file in the betterProof directory
# Change directory to betterProof if not already there
cd "$(dirname "$0")"

echo "Collecting build outputs into $OUTPUT_FILE"
echo "Collected Build Outputs" > "$OUTPUT_FILE"
echo "=======================" >> "$OUTPUT_FILE"

# Loop over all subdirectories
for dir in */
do
    # Skip the Common directory if it exists
    if [ "$dir" == "Common/" ]; then
        continue
    fi

    # Check if build_output.txt exists in the subdirectory
    BUILD_OUTPUT_FILE="$dir/build_output.txt"
    if [ -f "$BUILD_OUTPUT_FILE" ]; then
        echo "Processing $BUILD_OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"
        echo "---- Build Output for ${dir%/} ----" >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"
        cat "$BUILD_OUTPUT_FILE" >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"  # Add a blank line for separation
    else
        echo "No build_output.txt found in $dir"
    fi
done

echo "All build outputs have been collected into $OUTPUT_FILE"
