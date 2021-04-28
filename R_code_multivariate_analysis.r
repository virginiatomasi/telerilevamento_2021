#Multivariate analysis

library(raster)
library(RStoolbox)
setwd("C:/lab/")

#import the image with brick function (upload all the bands at once)
p224r63_2011 <- brick("p224r63_2011_masked.grd")
plot(p224r63_2011) #show the bands

plot(p224r63_2011$B1_sre, p224r63_2011$B2_sre) #plot two bands: B1_sre= blue; B2_sre= green
#change points in graph
plot(p224r63_2011$B1_sre, p224r63_2011$B2_sre, col="red", pch=19, cex=2)

#show correlation between the bands
pairs(p224r63_2011)

#new lesson-------------------------------------------------------------------------------------------------



