#$ -S /usr/bin/sh
#$ -j y
#$ -V
#$ -l m_mem_free=128G,h_vmem=128G
#$ -pe smp 1
#$ -cwd

module load R


Rscript enhancerPlot.R
