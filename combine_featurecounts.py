#!/usr/bin/env python3

import pandas as pd
import glob
import os

# Directory and output file
featurecounts_dir = "/storage/stacylab/WaterStudyRNAseq/readCounts/updatedAlignmentcorrectGTF"
output_file = os.path.join(featurecounts_dir, "combined_featurecounts.csv")

# Find featureCounts output files
files = glob.glob(f"{featurecounts_dir}/*_featurecounts_updatedAlignmentcorrect.txt")

# Initialize empty DataFrame
combined_data = pd.DataFrame()

for file in files:
    # Extract sample name from file name (e.g., "S8" from "S8_featurecounts_updatedAlignmentcorrect.txt")
    sample_name = os.path.basename(file).split("_")[0]

    # Read file while skipping comment line
    df = pd.read_csv(
        file,
        sep="\t",
        comment="#",
        header=0  # Use header row with full path
    )

    # Rename the last column (BAM file path) to the sample name
    bam_column = df.columns[-1]
    df.rename(columns={bam_column: sample_name}, inplace=True)

    # Keep only Geneid and sample count
    df = df[["Geneid", sample_name]]

    # Merge into combined DataFrame
    if combined_data.empty:
        combined_data = df
    else:
        combined_data = combined_data.merge(df, on="Geneid", how="outer")

# Fill missing values with 0 (some genes may be missing in certain samples)
combined_data.fillna(0, inplace=True)

# Save to CSV
combined_data.to_csv(output_file, index=False)
print(f"✅ Combined featureCounts file saved to: {output_file}")

