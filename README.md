# MYCN-methods-paper

## 1. LILY (Super Enhancer calling)
LILY is a pipeline for detection of super-enhancers using H3K27ac ChIP-seq data, which includes explicit correction for copy number variation inherent to cancer samples. The pipeline is based on the ROSE algorithm originally developed by the the Young lab. 

### Before running
Follow steps 1-3 provided in the LILY's github documentation (https://github.com/BoevaLab/LILY). Clone the repository to run LILY scripts.

### prerequisites
You will need following files to run LILY:
1. narrowPeak, regions.bed and .wig files for a particular sample should be present in the data folder
2. hg19_refseq.ucsc (transcriptome information which can be found at https://github.com/linlabbcm/rose2/tree/master/rose2/annotation)
3. hg19.chrom.sizes (file with chromosome lengths)

### How to run 
Script calls super enhances iteratively from all lines. Make sure to change data directory and result directory paths before running the script.
```R
Rscript lily.
```

## 2. Filtering Super Enhancers (SEs)
This step filters for super enhances present in two or more MYCN amplified/non-amplified lines.
Annotate all SEs called by LILY before running the filtering script.

### prerequisites
Annotated SEs called by LILY

### How to run
Change paths to directories to reflect paths to your files.

```R
Rscript SEfilter.R
```

## 3. Heatmaps
