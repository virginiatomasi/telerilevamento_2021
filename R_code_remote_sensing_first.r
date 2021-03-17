# My first code in R for remote sensing

#install.packages("raster") to install the package "raster" 

#once the package is installed, use it through the function library
library(raster) 

setwd("C:/lab/") #path to folder (where there are the files we want to use)  

p224r63_2011 <- brick("p224r63_2011_masked.grd") #first image loaded through the function brick
plot(p224r63_2011) #see the image loaded before
#B1 = blue
#B2 = green
#B3 = red
#B4 = near IR 
#B5 = middle IR
#B6 = thermal IR

