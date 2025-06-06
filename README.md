# RNA-seq-Hawaiian-Metrosideros-pipeline
This repository contains a reproducible pipeline for analyzing RNA-seq data from Metrosideros polymorpha var. incana, using high-performance computing resources.

## 🧪 Overview:
Samples: 69 paired-end RNA-seq FASTQ files (excluding S2, S9, S65)

Taxa: M. polymorpha var. incana, M. polymorpha var. glaberrima, M. polymorpha race "L", Metrosideros tremuloides

Reference Genome: Metrosideros_polymorpha_incana.scaffolded_11chr.fa

Annotation File: Metrosideros_polymorpha_incana.scaffolded.gtf

Platform: HPC (Cherry Creek at NSCEE)

Goals: Perform quality control, alignment, quantification, and differential expression

Steps included:
1. Quality control using FastQC
2. STAR genome alignment
3. Read quantification using featureCounts
4. Differential expression analysis using DESeq2 in R and EdgeR in OmicsBox

## 🔧 Requirements

- STAR
- FastQC
- featureCounts (Subread)
- samtools
- Omicsbox (EdgeR)
- R (with DESeq2)
