#$ -S /usr/bin/sh
#$ -j y
#$ -V
#$ -l m_mem_free=32G,h_vmem=64G
#$ -pe smp 1
#$ -cwd

module load R

Rscript SEPlot.R
