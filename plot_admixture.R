textpos <- function(x) {
  pos <- mean(x) + 1
  return(pos)
}

pop<-read.table("/home/biogeoanalysis/RAD/spicatumPhylogeography/06populations/pop",as.is=T)
group<-read.table("/home/biogeoanalysis/RAD/spicatumPhylogeography/06populations/group",as.is=T)
admix<-t(as.matrix(read.table("/home/biogeoanalysis/RAD/spicatumPhylogeography/06populations/K4")))
#admix<-admix[,order(pop[,1])]
group_sorted<-group[order(group[,1]),]
pop_sorted<-pop[order(pop[,1]),]
h <- barplot(admix, col=c("blue", "red", "orange", "darkgreen", "purple","brown","black"), 
             space=0, border=NA, xlab="Individuals", ylab="admixture")
text(tapply(1:nrow(group), group[,1],mean), -0.05, unique(group_sorted[,1]), xpd=T, srt=45, adj = c(0.60,0), cex = 0.85)
text(tapply(1:nrow(pop), pop[,1],textpos), 1.05, unique(pop_sorted[,1]), xpd=T, srt=45, adj = c(0.4,0), cex = 0.75)
abline(v=c(31,58,106), lwd=1.5)
abline(v=c(3,7,11,15,19,23,27,31,35,39,43,47,50,54,58,62,66,70,74,78,82,86,90,94,98,102,106,110,114,118,122,126,130,134,138), lty=2, lwd=0.5)


#SpicGrp_sub
#abline(v=c(7,15,23,30,34,46,62), lwd=1.5)
#abline(v=c(4,7,11,15,19,23,27,30,34,38,42,46,50,54,58,62,66,70,74,77,81,85), lty=2, lwd=0.5)
