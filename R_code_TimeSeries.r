#time series analysis
#Greenland increase of temperature
#data and code from Emanuela Cosma

#package raster and set working directory
library(raster)
setwd("C:/lab/greenland")

#raster function to each image
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

#Import all the images at once (two steps):
# 1-create a list of files to import = function "list.files"
rlist <- list.files(pattern="lst") #pattern= part of name in common between the images 
rlist #show the list
# 2-function lapply(name of the list of files, function to apply)
import <- lapply(rlist,raster) 
import #show the files

#put together the files = stack function
TGr <- stack(import)
plot(TGr) #now in TGr file we have all the images

------------------------------------------------------------------
#install.packages("raster")
#install.packages("rasterVis")
library(raster)
library(rasterVis)
setwd("C:/lab/greenland") #set working directory

rlist <- list.files(pattern="lst") #see above for the meaning of each step
import <- lapply(rlist,raster) 
TGr <- stack(import)
TGr #show the properties 

levelplot(TGr) #show the levels inside TGr
#show the level specified and the medium value of every column and row
levelplot(TGr$lst_2000) 

#change the colours and apply the function levelplot (using col.regions)
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
levelplot(TGr, col.regions=cl) #levelplot uses more shades of colours than plot

#level="attribute", we can change the names (names.attr=c("",...,"")
levelplot(TGr, col.regions=cl, names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))
#insert the title (main="")
levelplot(TGr, col.regions=cl, main="LST variation in time", names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))

#Melt analysis (same steps as above)
meltlist <- list.files(pattern="melt")
melt_import <- lapply(meltlist,raster)
Mr <- stack(melt_import)
levelplot(Mr)

#matrix algebra
#see the differences between two years 
melt_amount <- Mr$X2007annual_melt - Mr$X1979annual_melt
meltcl <- colorRampPalette(c("blue","white","red"))(100)
plot(melt_amount, col=meltcl)

levelplot(melt_amount, col.regions=meltcl)














