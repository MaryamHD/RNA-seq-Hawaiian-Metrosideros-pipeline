#!/bin/bash

# Output file
output="STAR_mapping_summary.csv"

# Write header
echo "Sample,Total_Reads,Uniquely_Mapped_Reads,Uniquely_Mapped_%,Multi_Mapped_%,Unmapped_Too_Short_%" > $output

# Loop through each final log file
for file in *.Log.final.out; do
    sample=$(basename "$file" .Log.final.out)

    total_reads=$(grep "Number of input reads" "$file" | awk '{print $NF}')
    unique_reads=$(grep "Uniquely mapped reads number" "$file" | awk '{print $NF}')
    unique_pct=$(grep "Uniquely mapped reads %" "$file" | awk '{print $NF}' | tr -d '%')
    multi_pct=$(grep "% of reads mapped to multiple loci" "$file" | awk '{print $NF}' | tr -d '%')
    unmapped_short_pct=$(grep "% of reads unmapped: too short" "$file" | awk '{print $NF}' | tr -d '%')

    echo "$sample,$total_reads,$unique_reads,$unique_pct,$multi_pct,$unmapped_short_pct" >> $output
done

