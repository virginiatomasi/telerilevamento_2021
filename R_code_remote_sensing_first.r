# My first code in R for remote sensing

#install.packages("raster") to install the package "raster" 

#once the package is installed, use it through the function library
library(raster) 

setwd("C:/lab/") #path to folder for Windows (where there are the files we want to use)  

p224r63_2011 <- brick("p224r63_2011_masked.grd") #first image loaded through the function brick
plot(p224r63_2011) #see the image loaded before
#B1 = blue
#B2 = green
#B3 = red
#B4 = near IR 
#B5 = middle IR
#B6 = thermal IR

#colour change= function colorRampPalette
cl <- colorRampPalette(c("black","grey","light grey"))(100)  
#the letter c is used to define an array made of the same elements
#the number 100 = number of levels between the colours

#plot the image with new colours: plot(image, col=cl) -> function "col" is used to define the colours
plot(p224r63_2011, col=cl)
