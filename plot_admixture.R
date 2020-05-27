#Script used to plot results of admixture (or any other structure like program that outputs Q-values or similar). plots names of populations 

admix<-t(as.matrix(read.table("/path/to/admixtureFile"))) #file has ending .Q
pop<-read.table("/path/to/popmap",as.is=T) #population file with name of individual in right column and name of population in left column. columns separated by tab.
#group<-read.table("/path/to/groupmap",as.is=T) #optional group file with name of individual in right column and name of group in left column. columns separated by tab.

pop_sorted<-pop[order(pop[,2]),]
#group_sorted<-group[order(group[,2]),] # uncomment if groupmap is used.

h <- barplot(admix, col=c("blue", "red", "orange", "darkgreen", "purple","brown","black"), 
             space=0, border=NA, ylab="admixture")
axis(1, tapply(1:nrow(pop), pop[,2],mean),unique(pop_sorted[,2]),las=2, cex.axis=0.6,tick = F,line = -0.8)
#axis(3, tapply(1:nrow(group), group[,2],mean),unique(group_sorted[,2]),las=2, cex.axis=0.6,tick = F,line = -0.8) # uncomment if groupmap is used.
abline(v=tapply(1:nrow(pop), pop[,2],max), lty=2, lwd=0.5)
#abline(v=tapply(1:nrow(group), group[,2],max), lty=1, lwd=1) # uncomment if groupmap is used
