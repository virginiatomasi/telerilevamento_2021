#R_code_classification.r

library(raster)
library(RStoolbox) #remote sensing toolbox

setwd("C:/lab/") #set working directory for Windows

so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg") #import the image

#visualize RGB levels
plotRGB(so, 1, 2, 3, stretch="lin")

#Unsupervised classification
soc <- unsuperClass(so, nClasses=3) #nClasses= number of classes to use
plot(soc$map) #we want to plot the map

son <- unsuperClass(so, nClasses=20) #with 20 classes
plot(son$map)

#Download an image from ESA - Solar Orbiter
sun <- brick("sun.png")
#Unsupervised classification
sunC <- unsuperClass(sun, nClasses=3)
plot(sunC$map)

#new lesson--------------------------------------------------------------------------------------
#Grand Canyon analysis

library(raster)
library(RStoolbox)
setwd("C:/lab/") #set working directory for Windows

gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpg") #import the image
plotRGB(gc, r=1, g=2, b=3, stretch="lin") #plot the image in RGB bands with linear stretching
plotRGB(gc, r=1, g=2, b=3, stretch="hist") #plot the image in RGB bands with histogram stretching

#Unsupervised classification
gcc <- unsuperClass(gc, nClasses=2) #nClasses= number of classes to use
gcc
plot(gcc$map)

gcc4 <- unsuperClass(gc, nClasses=4) #4 classes
plot(gcc4$map)
