#First analysis with Copernicus data 
#Burnt Area

#install.packages("ncdf4") 
library(raster)
library(ncdf4)

setwd("C:/lab/") #set working directory

fire <- raster("burnt_area.nc") #import the image
fire #show the properties of the image called "fire"

cl <- colorRampPalette(c("blue","light blue","red", "pink")) (100) #change the colours
plot(fire, col=cl) #plot the image

#modify the size of dataset



