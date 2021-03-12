# My first code in R for remote sensing

library(raster)
setwd("C:/lab/") #path to folder  
p224r63_2011 <- brick("p224r63_2011_masked.grd") #first image loaded
plot(p224r63_2011) #see the image
