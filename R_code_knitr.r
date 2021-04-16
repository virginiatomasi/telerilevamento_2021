#Use knitr
#organize a file

setwd("C:/lab/") #set working directory for Windows

library(knitr)

#stitch function
stitch("R_code_greenland.r.docx", template=system.file("misc", "knitr-template.Rnw", package="knitr"))

