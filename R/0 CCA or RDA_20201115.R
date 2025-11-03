
setwd("C:/Users/Think/Desktop/R_testdata/4_CCA or RDA")  
library(vegan)

hjyz=read.csv('env_table.csv',header=T,row.names=1)   
OTU=read.csv('OTU_table.csv',header=T,row.names=1)  
unifrac=read.csv('unweighted_unifrac.csv',header=T,row.names=1)  
caption=read.csv('caption.csv',header=T,row.names=1)  




OTU=read.csv('OTU_table.csv',header=T,row.names=1) ###
decorana(OTU)





CCAwater=cca(OTU,hjyz,scale=T)  
pdf('CCA.PDF')  
par(lwd=2,col="black",font=2,lty=1,col.lab='black',cex.lab=1.6,cex.axis=1.3,font.lab=2,font.axis=2)   
plot(CCAwater,display=c('wa','bp'),type='p',xlab=paste('CCA1=',round(CCAwater$CCA$eig[1]/CCAwater$tot.chi*100,2),'%'),ylab=paste('CCA2=',round(CCAwater$CCA$eig[2]/CCAwater$tot.chi*100,2),'%'),col="black",lwd=2);points(CCAwater,display='si',pch=as.numeric(caption$Legend),col=as.character(caption$Color),cex=2) 
###text(CCAwater,labels=hjyz$HSL)
ordiellipse(CCAwater,groups=caption$Group,display="sites",conf=0.75,draw="lines",col=as.character(caption$Color),label=FALSE,lwd=2)
axis(side=1,lwd = 2, lwd.tick =2)
axis(side=2,lwd = 2, lwd.tick =2)
legend('topright',bty='n',paste(c('YSTC','BYSTC','FYSTC','YSTC1','BYSTC1','FYSTC1')),col=c('red','blue','orange','red','blue','orange'),pch=c(16,16,16,17,17,17),cex=1.2,inset=0.02)
dev.off()
envfit(CCAwater,hjyz,permu=999)  


hjyz.dist <- vegdist(scale(hjyz),method = 'euclidean')
