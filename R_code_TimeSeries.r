#time series analysis
#Greenland increase of temperature
#data and code from Emanuela Cosma

#package raster and set working directory
library(raster)
setwd("C:/lab/greenland")

#raster function
lst_2000 <- raster("lst_2000.tif") #import a single dataset= raster function
plot(lst_2000) #plot the image
#import the images
lst_2005 <- raster("lst_2005.tif")
lst_2010 <- raster("lst_2010.tif")
lst_2015 <- raster("lst_2015.tif")
#plot the images 
par(mfrow=c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)

#import all the images at once (two steps):
# 1-create a list of files to import = function "list.files"
rlist <- list.files(pattern="lst") #pattern= part of name in common between the images 
rlist #show the list
# 2-function lapply(name of the list of files, function to apply)
import <- lapply(rlist,raster) 
import #show the files

#put together the files = stack function
TGr <- stack(import)
plot(TGr) #now in TGr file we have all the images
