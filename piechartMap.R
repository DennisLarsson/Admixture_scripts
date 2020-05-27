library(rworldmap)
library(plotrix)
#give path to csv file
#make sure that the columns with the average admixture values have the names like 'AverK3_1' etc, you can add or remove them as you see fit in the script below if you have different K
admixData <- read.csv("/home/biogeoanalysis/RAD/spicatumPhylogeography/06populations/pieplot_K4.csv",header=TRUE)

#plots map and axes
worldmap <- getMap(resolution = "low")
plot(worldmap, xlim = c(0, 20), ylim = c(37, 55))
box(which="plot")
axis(1)
axis(2)

bordCol = "black"

#only necessary if you have many in the same area, and want to space them a bit. CoordLong should be actual place on map, and plotLong will be where they are plotted. 
#the below function will add arrows from actual area to the plotted piechart
for (x in 1:nrow(admixData)) {
  arrows(x0=admixData$CoordLong[x],y0=admixData$CoordLat[x],x1=admixData$plotLong[x],y1=admixData$plotLat[x], length = 0, lwd = 1.5)
}

#plots the piecharts, admixData$AverK3_1 etc can be changed and extended if needed, example: admixData$AverK4_1[x],admixData$AverK4_2[x],admixData$AverK4_3[x],admixData$AverK4_4[x]
#Just make sure the column names in your input csv matches those in the for loop! 
for (x in 1:nrow(admixData)) {
  floating.pie(admixData$plotLong[x], admixData$plotLat[x], c(admixData$Aver_G1[x],admixData$Aver_G2[x],admixData$Aver_G3[x],admixData$Aver_G4[x]), 
               radius=0.55, col=c("blue", "red", "orange", "darkgreen", "purple","brown","black"), lwd = 1, border = bordCol)

}

#function to put labels in map
#for (x in 1:nrow(admixData)) {
#  text(admixData$plotLong[x], admixData$plotLat[x], labels=admixData$pop[x], cex= 0.7, pos = 4, offset = 1, pch = )
#}