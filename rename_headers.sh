#!/bin/bash

# Define the input and output folders
input_folder="./"
output_folder="/mnt/d/FYP2/4.Metagenome_assembly/metaSPAdes_rename_results"

# Loop through samples from 479 to 922
for sample_number in {479..922}; do
    input_file="SRR7217${sample_number}_MSP.FA"
    output_file="${input_file}"

    # Run seqtk rename command to rename the header
    seqtk rename "${input_folder}/${input_file}" "SRR7217${sample_number}_MSP_" > "${output_folder}/${output_file}"

# Modify the header using sed and save to a temporary file
sed -E 's/^>(SRR7217[0-9]+_MSP)([0-9]+) flag=[0-9]+ multi=[0-9]+\.[0-9]+ len=[0-9]+/>\1_\2/' "${output_folder}/${output_file}" > "${output_folder}/${output_file}.tmp"

# Rename the temporary file to the original output file
mv "${output_folder}/${output_file}.tmp" "${output_folder}/${output_file}"

# Remove the temporary file
    rm "${output_file}.tmp"

    # Check if the output file is not empty (non-zero size)
    if [ -s "${output_file}" ]; then
        echo "Processed ${input_file} and saved as ${input_file}"
    else
        # Remove the 0KB output file
        rm "${output_file}"
        echo "Warning: Output file for ${input_file} is empty. Removed."
    fi
done


