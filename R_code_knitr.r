#Use knitr
#organize a file

setwd("C:/lab/") #set working directory for Windows

library(knitr)

#stitch function
stitch("R_code_Greenland.r.txt", template=system.file("misc", "knitr-template.Rnw", package="knitr"))


#if problems appear:
#install.packages("tinytex")
#tinytex::install_tinytex()
#tinytex::tlmgr_update()
