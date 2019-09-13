# script to create unique list of SE for MYCN amp and non-amp lines

mycn_amp <- c('COGN415', 'KELLY', 'LAN5', 'NB1643', 'NGP', 'SKNBE2C')
mycn_Nonamp <- c('NB69', 'NBLS', 'SKNAS', 'SKNFI', 'SKNSH')

dir <-  '/Volumes/target_nbl_ngs/KP/enhancer-rank-list-H3K27Ac/LILY/result/SE_scores_anno/'

for(x in mycn_amp){
  print(x)
  
  file <- paste0(x,'-H3K27Ac')
  assign(file, read.delim(paste0(dir, file,'.scores.bed.SE.scores.bed.sorted.SE.bed.anno.txt'), header = T))

}


SE_MYCN_amp <- unique(Reduce(function(x, y) union(x, y), list(`COGN415-H3K27Ac`[,16], `KELLY-H3K27Ac`[,16], `LAN5-H3K27Ac`[,16],
                                            `NB1643-H3K27Ac`[,16], `NGP-H3K27Ac`[,16], `SKNBE2C-H3K27Ac`[,16])))


write.table(SE_MYCN_amp, file = paste0(Sys.Date(),'_SE_LILY_MYCN_amp.txt'), quote = F, col.names = F, row.names = F, sep = '\t')

for(x in mycn_Nonamp){
  print(x)
  
  file <- paste0(x,'-H3K27Ac')
  assign(file, read.delim(paste0(dir, file,'.scores.bed.SE.scores.bed.sorted.SE.bed.anno.txt'), header = T))
  
}


SE_NON_MYCN_amp <- unique(Reduce(function(x, y) union(x, y), list(`NB69-H3K27Ac`[,16], `NBLS-H3K27Ac`[,16], `SKNAS-H3K27Ac`[,16], `SKNFI-H3K27Ac`[,16], `SKNSH-H3K27Ac`[,16])))

write.table(SE_NON_MYCN_amp, file = paste0(Sys.Date(),'_SE_LILY_MYCN_NonAmp.txt'), quote = F, col.names = F, row.names = F, sep = '\t')
