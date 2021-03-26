# My first code in R for remote sensing

#install.packages("raster") to install the package "raster" 

#once the package is installed, use it through the function library
library(raster) 

setwd("C:/lab/") #path to folder for Windows (where there are the files we want to use)  

p224r63_2011 <- brick("p224r63_2011_masked.grd") #first image loaded through the function "brick"
plot(p224r63_2011) #see the image loaded before
#B1 = blue
#B2 = green
#B3 = red
#B4 = near IR (nir)
#B5 = middle IR
#B6 = thermal IR

#colour change= function colorRampPalette
cl <- colorRampPalette(c("black","grey","light grey"))(100)  
#the letter c is used to define an array made of the same elements
#the number 100 = levels between the colours (define the shades)

#plot the image with new colours: plot(image, col=cl) -> function "col" 
plot(p224r63_2011, col=cl)

#plot just one band
#dev.off will clean the current graph
dev.off()
plot(p224r63_2011$B1_sre) #plot band B1 of the image

#plot two bands at the same time:
#function par, mf= multiframe, defining rows and columns
par(mfrow=c(2,1)) 
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)

#plot the first four bands of Landsat
par(mfrow=c(4,1)) #4 rows and 1 column
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)

par(mfrow=c(2,2)) #2 rows and 2 columns
plot(p224r63_2011$B1_sre, col=cl)
plot(p224r63_2011$B2_sre, col=cl)
plot(p224r63_2011$B3_sre, col=cl)
plot(p224r63_2011$B4_sre, col=cl)

#plot with different colours for every images
par(mfrow=c(2,2))
clb <- colorRampPalette(c("dark blue","blue","light blue"))(100)
plot(p224r63_2011$B1_sre, col=clb)
clg <- colorRampPalette(c("dark green","green","light green"))(100)
plot(p224r63_2011$B2_sre, col=clg)
clr <- colorRampPalette(c("dark red","red","pink"))(100)
plot(p224r63_2011$B3_sre, col=clr)
clnir <- colorRampPalette(c("red","orange","yellow"))(100)
plot(p224r63_2011$B4_sre, col=clnir)

#natural colours: "plotRGB" to plot an image using RGB bands, stretching the bands (Lin= linear function)
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin") #no blue band (what was in the red band, now is in nir band)
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin") #purple in the image is bare soil
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin") #yellow in the image is bare soil

par(mfrow=c(2,2)) #let's put together the images above
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin") 
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin") 
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")





