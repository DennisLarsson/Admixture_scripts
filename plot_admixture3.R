#Script used to plot results of admixture (or any other structure like program that outputs Q-values or similar). plots names of populations 
setwd("/path/to/folder/")
inputfile.name = "admix_sorted.csv"

inputfile<-read.csv(inputfile.name, header = F)
a <- t(as.matrix(inputfile[5:ncol(inputfile)]))
p <- inputfile[1:2]
g <- inputfile[3:4]

namefile = strsplit(inputfile.name,split = ".", fixed = TRUE)
namefile = namefile[[1]][1]

plot.admix <- function(admix, pop, group) {
  pop_sorted<-pop[order(pop[,2]),]
  group_sorted<-group[order(group[,2]),] # uncomment if groupmap is used.
  h <- barplot(admix, col=c("blue", "red", "orange", "darkgreen", "purple","brown","black"), 
               space=0, border=NA, ylab="admixture")
  axis(1, tapply(1:nrow(pop), pop[,2],mean),unique(pop_sorted[,2]),las=2, cex.axis=0.6,tick = F,line = -0.8)
  axis(3, tapply(1:nrow(group), group[,2],mean),unique(group_sorted[,2]),las=2, cex.axis=0.6,tick = F,line = -0.8) # uncomment if groupmap is used.
  abline(v=tapply(1:nrow(pop), pop[,2],max), lty=2, lwd=0.5)
  abline(v=tapply(1:nrow(group), group[,2],max), lty=1, lwd=1) # uncomment if groupmap is used.
}

pdf(file = paste(namefile,".pdf",sep=""), height = 8, width = 14)
plot.admix(a,p,g)
dev.off()

png(filename = paste(namefile,".png",sep=""), height = 800, width = 1400, res = 100)
plot.admix(a,p,g)
dev.off()
