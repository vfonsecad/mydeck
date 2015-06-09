require(devtools)
#install_github("slidify", "ramnathv")
#install_github("slidifyLibraries", "ramnathv")
library(slidify)
library(slidifyLibraries)

#author("mydeck") ## Rmd file is generated, first edit before running the next line
setwd("~/Documents/Eventos/gun_deaths_presentation/gun_deaths_pres/mydeck")


slidify("index.Rmd") ## html file is generated
browseURL("index.html")







##############################      SHINY APP           ##################################################################


library(shiny)
runApp("/Users/valeria/Documents/Eventos/gun_deaths_app")
setwd("/Users/valeria/Documents/Eventos")
library(devtools)
devtools::install_github('rstudio/shinyapps')
library(shinyapps)
shinyapps::setAccountInfo(name='valeria', token='E9AFBA0FC0E7E60AD252D61A3EA54D1A', secret='m89SftXWfKdse1Aqqi4g38DXwvPQtAp7fsJTDGpZ')
shinyapps::deployApp("/Users/valeria/Documents/Eventos/gun_deaths_app")
