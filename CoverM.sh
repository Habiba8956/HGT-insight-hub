#!/bin/bash

# Specify input and output directories
reads_dir="/mnt/d/FYP2/3.hg_trimmed/"
assembly_dir="/mnt/d/FYP2/8.Gene_Extraction/gene_metaSPAdes_csd_filtered_dire_extraction"
output_dir="/mnt/d/FYP2/6.CoverM/gene_coverm_metaSPAdes_waafle_csd_filtered_dire_output/"
#output_dir="/mnt/d/FYP/9.CoverM/"
# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Loop over sample numbers
for sample_number in {475..923}; do
    # Build input file paths
    input_r1="${reads_dir}SRR7217${sample_number}_1.fastq.gz"
    input_r2="${reads_dir}SRR7217${sample_number}_2.fastq.gz"
    assembly_file="${assembly_dir}/gene_SRR7217${sample_number}.fa"

    # Build output file path
    output_file="${output_dir}SRR7217${sample_number}.tsv"

    # Run the coverm command
    coverm contig -1 "$input_r1" -2 "$input_r2" -r "$assembly_file" --min-read-percent-identity 0.95 --min-read-aligned-percent 0.5 --methods count --output-file "$output_file"

    # Check and remove empty/0KB files
    if [ ! -s "$output_file" ]; then
        echo "Removing empty file: $output_file"
        rm "$output_file"
    fi
done
