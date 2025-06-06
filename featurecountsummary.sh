#!/bin/bash

# Define the directory containing the featureCounts summary files
SUMMARY_DIR="/storage/stacylab/WaterStudyRNAseq/readCounts/updatedAlignmentcorrectGTF"
OUTPUT_FILE="featurecounts_summary.tsv"

# Create or clear the output file
echo -e "Sample\tAssigned\tUnassigned_Unmapped\tUnassigned_Read_Type\tUnassigned_Singleton\tUnassigned_MappingQuality\tUnassigned_Chimera\tUnassigned_FragmentLength\tUnassigned_Duplicate\tUnassigned_MultiMapping\tUnassigned_Secondary\tUnassigned_NonSplit\tUnassigned_NoFeatures\tUnassigned_Overlapping_Length\tUnassigned_Ambiguity" > $OUTPUT_FILE

# Loop through each featureCounts summary file in the directory
for file in $SUMMARY_DIR/*.summary; do
    # Extract the sample name from the file name (you can modify this based on your file naming convention)
    SAMPLE_NAME=$(basename "$file" .summary)

    # Extract relevant data from the summary file
    ASSIGNED=$(grep "Assigned" "$file" | awk '{print $2}')
    UNASSIGNED_UNMAPPED=$(grep "Unassigned_Unmapped" "$file" | awk '{print $2}')
    UNASSIGNED_READ_TYPE=$(grep "Unassigned_Read_Type" "$file" | awk '{print $2}')
    UNASSIGNED_SINGLETON=$(grep "Unassigned_Singleton" "$file" | awk '{print $2}')
    UNASSIGNED_MAPPINGQUALITY=$(grep "Unassigned_MappingQuality" "$file" | awk '{print $2}')
    UNASSIGNED_CHIMERA=$(grep "Unassigned_Chimera" "$file" | awk '{print $2}')
    UNASSIGNED_FRAGMENTLENGTH=$(grep "Unassigned_FragmentLength" "$file" | awk '{print $2}')
    UNASSIGNED_DUPLICATE=$(grep "Unassigned_Duplicate" "$file" | awk '{print $2}')
    UNASSIGNED_MULTIMAPPING=$(grep "Unassigned_MultiMapping" "$file" | awk '{print $2}')
    UNASSIGNED_SECONDARY=$(grep "Unassigned_Secondary" "$file" | awk '{print $2}')
    UNASSIGNED_NONSPLIT=$(grep "Unassigned_NonSplit" "$file" | awk '{print $2}')
    UNASSIGNED_NOFEATURES=$(grep "Unassigned_NoFeatures" "$file" | awk '{print $2}')
    UNASSIGNED_OVERLAPPING_LENGTH=$(grep "Unassigned_Overlapping_Length" "$file" | awk '{print $2}')
    UNASSIGNED_AMBIGUITY=$(grep "Unassigned_Ambiguity" "$file" | awk '{print $2}')
    
    # Write the extracted information to the output file in TSV format
    echo -e "$SAMPLE_NAME\t$ASSIGNED\t$UNASSIGNED_UNMAPPED\t$UNASSIGNED_READ_TYPE\t$UNASSIGNED_SINGLETON\t$UNASSIGNED_MAPPINGQUALITY\t$UNASSIGNED_CHIMERA\t$UNASSIGNED_FRAGMENTLENGTH\t$UNASSIGNED_DUPLICATE\t$UNASSIGNED_MULTIMAPPING\t$UNASSIGNED_SECONDARY\t$UNASSIGNED_NONSPLIT\t$UNASSIGNED_NOFEATURES\t$UNASSIGNED_OVERLAPPING_LENGTH\t$UNASSIGNED_AMBIGUITY" >> $OUTPUT_FILE
done

echo "Summary file generated: $OUTPUT_FILE"

