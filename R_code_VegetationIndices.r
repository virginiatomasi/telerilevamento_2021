#Vegetation Indices

library(raster)
library(RStoolbox)
setwd("C:/lab/")

defor1 <- brick("defor1.jpg")
defor2 <- brick("defor2.jpg")

#plot the images
#b1=NIR, b2=red, b3= green
par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

#Difference vegetation index = difference between NIR and RED for every pixel in the image
#DVI defor1= NIR(defor1.1) - RED(defor1.2)
dvi1 <- defor1$defor1.1 - defor1$defor1.2
plot(dvi1)
#plot dvi1 with different colours: red= vegetation
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(dvi1, col=cl, main="DVI at time 1")

#DVI defor2= NIR(defor1.1) - RED(defor1.2)
dvi2 <- defor2$defor2.1 - defor2$defor2.2
plot(dvi2)
#plot dvi1 with different colours: red= vegetation
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(dvi2, col=cl,main="DVI at time 2")

par(mfrow=c(2,1)) #plot the two DVI images
plot(dvi1, col=cl, main="DVI at time 1")
plot(dvi2, col=cl,main="DVI at time 2")

#DVI between the two moments
difdvi <- dvi1 - dvi2
cld <- colorRampPalette(c('blue','white','red'))(100) #new colours: max difference= red zones
plot(difdvi, col=cld)




#NDVI: normalized difference vegetation index= (NIR-RED)/(NIR+RED) or DVI/(NIR+RED)
ndvi1 <- (defor1$defor1.1 - defor1$defor1.2)/(defor1$defor1.1 + defor1$defor1.2)
#ndvi1 <- dvi1/(defor1$defor1.1 + defor1$defor1.2) gives the same result
plot(ndvi1, col=cl, main="NDVI at time 1")

ndvi2 <- (defor2$defor2.1 - defor2$defor2.2)/(defor2$defor2.1 + defor2$defor2.2)
#ndvi2 <- dvi2/(defor2$defor2.1 + defor2$defor2.2) gives the same result
plot(ndvi2, col=cl, main="NDVI at time 2")




#RStoolbox: spectralIndices= for vegetation indices calculation
vi <- spectralIndices(defor1, green=3, red=2, nir=1)
plot(vi, col=cl) #show all the indices
plot(vi$NDWI, col=cl) #NDWI: normalized difference water index, related to the plant water content

vi2 <- spectralIndices(defor2, green=3, red=2, nir=1)
plot(vi2, col=cl) #show all the indices
plot(vi2$NDWI, col=cl)
