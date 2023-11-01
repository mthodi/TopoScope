#!/bin/bash

# This script is used to clean the AS path of the BGP update messages.
# It cleans the AS Paths that were prepended with 100 200 300 ... 900

src_file="africa_rib.txt"
temp_dir="/tmp/split_chunks"
dest_file="africa_rib_cleaned.txt"

# Check if the source file exists
if [ ! -f "$src_file" ]; then
    echo "Source file $src_file does not exist."
    exit 1
fi

# Create temporary directory
mkdir -p "$temp_dir"

# Split the source file into chunks
split -l $(($(wc -l < "$src_file") / 4)) "$src_file" "${temp_dir}/chunk_"

# Define a function to perform sed operations on a file
process_file() {
    local file="$1"
    sed -i -e 's/100|200|300|400|500|600|700|800|900|//g' \
           -e 's/100|200|300|400|500|600|//g' \
           -e 's/100|200|300|400|//g' \
           -e 's/36913|100|37294/36913|37294/g' "$file"
}

# Export the function so it's available to parallel
export -f process_file

# Run sed in parallel on each chunk
find "/tmp/split_chunks/" -name 'chunk_*' | parallel --no-notice process_file

# Concatenate the modified chunks back into a single file
cat ${temp_dir}/chunk_* > "$dest_file"

# Clean up the temporary files and directory
# rm -r "$temp_dir"

echo "Processing completed."
