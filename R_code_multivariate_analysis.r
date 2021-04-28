#Multivariate analysis

library(raster)
library(RStoolbox)
setwd("C:/lab/") #set working directory for Windows

#import the image with brick function (upload all the bands at once)
p224r63_2011 <- brick("p224r63_2011_masked.grd")
plot(p224r63_2011) #show the bands

plot(p224r63_2011$B1_sre, p224r63_2011$B2_sre) #plot two bands: B1_sre= blue; B2_sre= green
#change points in graph
plot(p224r63_2011$B1_sre, p224r63_2011$B2_sre, col="red", pch=19, cex=2)

#show the correlation between bands (scatter plots and Pearson's index)
pairs(p224r63_2011)

#new lesson-------------------------------------------------------------------------------------------------
library(raster)
library(RStoolbox)
setwd("C:/lab/") #set working directory for Windows

p224r63_2011 <- brick("p224r63_2011_masked.grd")
pairs(p224r63_2011) #show the correlation between bands (scatter plots and Pearson's index)
#aggregate cells: resampling
p224r63_2011_res <- aggregate(p224r63_2011, fact=10)

par(mfrow=c(2,1)) #plotRGB in 2 rows and 1 column
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="lin")
plotRGB(p224r63_2011_res, r=4, g=3, b=2, stretch="lin")

#PCA analysis
p224r63_2011_res_pca <-rasterPCA(p224r63_2011_res) #inside: a map and a model
summary(p224r63_2011_res_pca$model) #show the statistical information
plot(p224r63_2011_res_pca$map) #show PCA for each band

plotRGB(p224r63_2011_res_pca$map, r=1, g=2, b=3, stretch="lin")
