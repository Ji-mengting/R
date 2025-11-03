setwd("C:/Users/Think/Desktop/R_testdata/6_PERMANOVA and Anosim") 
library(vegan)

hjyz=read.csv('env_table.csv',header=T,row.names=1)   
OTU=read.csv('OTU_table.csv',header=T,row.names=1)  
unifrac=read.csv('unweighted_unifrac.csv',header=T,row.names=1)  


	adonis(OTU~nirS,data=hjyz,permutations=999,method='bray')
    adonis(unifrac~nirS,data=hjyz,permutations=999)  
	caption=read.csv('caption.csv',header=T,row.names=1)  
	adonis(OTU~Group,data=caption,permutations=999,method='bray')   
	adonis(unifrac~Group,data=caption,permutations=999)   


group=c(1,1,1,1,1,2,2,2,2,2)
otu.dist=vegdist(OTU,method='bray')  
anosim(otu.dist,group,permutations=999)

group=c(1,1,1,1,1,2,2,2,2,2)
otu.dist=read.csv('unweighted_unifrac.csv',header=T,row.names=1) 
anosim(otu.dist,group,permutations=999)
