#R_code_classification.r

library(raster)
library(RStoolbox)

setwd("C:/lab/") #set working directory for Windows

so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg") #import the image

#visualize RGB levels
plotRGB(so, 1, 2, 3, stretch="lin")

#Unsupervised classification
soc <- unsuperClass(so, nClasses=3) #nClasses= number of classes to use
plot(soc$map) #we want to plot the map

son <- unsuperClass(so, nClasses=20) #with 20 classes

#Download an image from ESA - Solar Orbiter
sun <- brick("sun.png")
#Unsupervised classification
sunC <- unsuperClass(sun, nClasses=3)
plot(sunC$map)


