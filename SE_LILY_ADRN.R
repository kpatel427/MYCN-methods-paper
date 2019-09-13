# script to create overlaps between ADRN cell lines (except SKNSH)

adrn_cl <- c('COGN415', 'KELLY', 'LAN5', 'NB1643', 'NGP', 'SKNBE2C', 'NB69', 'NBLS', 'SKNAS', 'SKNFI')
dir <-  '/Volumes/target_nbl_ngs/KP/enhancer-rank-list-H3K27Ac/LILY/result/SE_scores_anno/'

for(x in adrn_cl){
  print(x)
  
  file <- paste0(x,'-H3K27Ac')
  assign(file, read.delim(paste0(dir, file,'.scores.bed.SE.scores.bed.sorted.SE.bed.anno.txt'), header = T))
  
}


adrn_overlap <- unique(Reduce(function(x, y) union(x, y), 
                                 list(`COGN415-H3K27Ac`[,16],
                                      `KELLY-H3K27Ac`[,16],
                                      `LAN5-H3K27Ac`[,16],
                                      `NB1643-H3K27Ac`[,16],
                                      `NGP-H3K27Ac`[,16],
                                      `SKNBE2C-H3K27Ac`[,16],
                                      `NB69-H3K27Ac`[,16], 
                                      `NBLS-H3K27Ac`[,16], 
                                      `SKNAS-H3K27Ac`[,16], 
                                      `SKNFI-H3K27Ac`[,16])))

write.table(adrn_overlap, file = paste0(Sys.Date(),'_SE_LILY_ADRN_overlap.txt'), quote = F, col.names = F, row.names = F, sep = '\t')

