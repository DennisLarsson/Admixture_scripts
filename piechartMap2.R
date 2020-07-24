library(rworldmap)
library(plotrix)
#give path to csv file

setwd("/path/to/folder/")
inputfile.name = "average_admixture_ratios.csv"

print.label = FALSE

namefile = strsplit(inputfile.name,split = ".", fixed = TRUE)
namefile = namefile[[1]][1]

inputfile <- read.csv(inputfile.name,header=FALSE, as.is=TRUE)

plot.piechart <- function(admixData, lab) {
  #plots map and axes
  worldmap <- getMap(resolution = "low")
  plot(worldmap, xlim = c(min(admixData[,3]), max(admixData[,3])), ylim = c(min(admixData[,4]), max(admixData[,4])))
  box(which="plot")
  axis(1)
  axis(2)
  
  bordCol = "black"
  
  chart.data <- admixData[5:ncol(admixData)]
  #plots the piecharts, admixData$AverK3_1 etc can be changed and extended if needed, example: admixData$AverK4_1[x],admixData$AverK4_2[x],admixData$AverK4_3[x],admixData$AverK4_4[x]
  #Just make sure the column names in your input csv matches those in the for loop! 
  for (x in 1:nrow(admixData)) {
    floating.pie(admixData[x,3], admixData[x,4], unlist(chart.data[x,]), 
                 radius=0.55, col=c("blue", "red", "orange", "darkgreen", "purple","brown","black"), lwd = 1, border = bordCol)
  
  }
  if (lab) {
    #function to put labels in map
    for (x in 1:nrow(admixData)) {
      text(admixData[x,3], admixData[x,4], labels=admixData[x,1], cex= 0.7, pos = 3, offset = 1)
    }
  }
}

pdf(file = paste(namefile,".pdf",sep=""),width =10, height = 10)
plot.piechart(inputfile,print.label)
dev.off()

png(filename = paste(namefile,".png",sep=""),width =1000, height = 1000)
plot.piechart(inputfile,print.label)
dev.off()