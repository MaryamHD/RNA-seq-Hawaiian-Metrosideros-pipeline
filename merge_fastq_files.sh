#!/bin/bash

# Directory containing the FASTQ files
input_dir="/Volumes/Untitled/WaterStudyRNAseq/1159-Maryam-425401522"
output_base_dir="/Volumes/Untitled/WaterStudyRNAseq/1159-Maryam-425401522/merged_fastq_files"

# Create base output directory if it does not exist
mkdir -p "$output_base_dir"

# List of sample IDs to process
sample_ids=("S1" "S3" "S4" "S5" "S6" "S7" "S8" "S9" "S10" "S11" "S12" "S13" "S14" "S15" "S16" "S17" "S18" "S19" "S20" "S21" "S22" "S23" "S24" "S25" "S26" "S27" "S28" "S29" "S30" "S31" "S32" "S33" "S34" "S35" "S36" "S37" "S38" "S39" "S40" "S41" "S42" "S43" "S44" "S45" "S46" "S47" "S48" "S49" "S50" "S51" "S52" "S53" "S54" "S55" "S56" "S57" "S58" "S59" "S60" "S61" "S62" "S63" "S64" "S66" "S67" "S68" "S69" "S70" "S71" "S72")

# Process each sample
for sample_id in "${sample_ids[@]}"; do
    echo "Processing sample: $sample_id"
    
    # Create a separate directory for each sample
    sample_output_dir="$output_base_dir/$sample_id"
    mkdir -p "$sample_output_dir"

    # Define file names based on the naming convention
    r1_a="$input_dir/BCLConvert_07_25_2024_15_57_17Z-752437710/${sample_id}-a/${sample_id}-a_${sample_id}_L001_R1_001.fastq.gz"
    r1_b="$input_dir/BCLConvert_07_27_2024_06_29_03Z-753025273/${sample_id}-b/${sample_id}-b_${sample_id}_L001_R1_001.fastq.gz"
    r2_a="$input_dir/BCLConvert_07_25_2024_15_57_17Z-752437710/${sample_id}-a/${sample_id}-a_${sample_id}_L001_R2_001.fastq.gz"
    r2_b="$input_dir/BCLConvert_07_27_2024_06_29_03Z-753025273/${sample_id}-b/${sample_id}-b_${sample_id}_L001_R2_001.fastq.gz"

    # Print the file paths for debugging
    echo "Looking for R1-a: $r1_a"
    echo "Looking for R1-b: $r1_b"
    echo "Looking for R2-a: $r2_a"
    echo "Looking for R2-b: $r2_b"

    # Check if files exist before merging
    if [[ ! -f $r1_a || ! -f $r1_b ]]; then
        echo "Missing R1 files for sample $sample_id. Skipping..."
        continue
    fi
    if [[ ! -f $r2_a || ! -f $r2_b ]]; then
        echo "Missing R2 files for sample $sample_id. Skipping..."
        continue
    fi

    # Define the output files
    merged_r1="$sample_output_dir/${sample_id}_merged_R1.fastq.gz"
    merged_r2="$sample_output_dir/${sample_id}_merged_R2.fastq.gz"

    # Merge the R1 reads
    cat "$r1_a" "$r1_b" > "$merged_r1"
    echo "Merged R1 reads for sample $sample_id"

    # Merge the R2 reads
    cat "$r2_a" "$r2_b" > "$merged_r2"
    echo "Merged R2 reads for sample $sample_id"

    echo "Merging complete for sample $sample_id!"
done
