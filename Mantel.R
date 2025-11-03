setwd("C:/Users/Think/Desktop/R_testdata/5_Mantel test")
library(vegan)

hjyz=read.csv('env_table.csv',header=T,row.names=1)   
OTU=read.csv('OTU_table.csv',header=T,row.names=1)  
unifrac=read.csv('unweighted_unifrac.csv',header=T,row.names=1)  




unifrac=read.csv('unweighted_unifrac.csv',header=T,row.names=1)
	
	mantel(unifrac,vegdist(scale(hjyz[,1]),method='euclidean'),method='spearman',permutation=999)    
mantel(unifrac,vegdist(scale(hjyz[,1]),method='euclidean'),method='spearman',permutation=999)
mantel(unifrac,vegdist(scale(hjyz[,2]),method='euclidean'),method='spearman',permutation=999)
mantel(unifrac,vegdist(scale(hjyz[,3]),method='euclidean'),method='spearman',permutation=999)
mantel(unifrac,vegdist(scale(hjyz[,4]),method='euclidean'),method='spearman',permutation=999)
mantel(unifrac,vegdist(scale(hjyz[,5]),method='euclidean'),method='spearman',permutation=999)
mantel(unifrac,vegdist(scale(hjyz[,6]),method='euclidean'),method='spearman',permutation=999)
mantel(unifrac,vegdist(scale(hjyz[,7]),method='euclidean'),method='spearman',permutation=999)
mantel(unifrac,vegdist(scale(hjyz[,8]),method='euclidean'),method='spearman',permutation=999)
mantel(unifrac,vegdist(scale(hjyz[,9]),method='euclidean'),method='spearman',permutation=999)
