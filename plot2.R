library(data.table)
library(dplyr)
library(ggplot2)
library(lubridate)

##reading in data form exdata_data_NEI data set - data folder should be in working directory
  NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
  SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

##filter data related to Baltimore City
  NEI_BC <- filter(NEI, fips == "24510")

##open PNG device: creates "plot2.png" in working directory  
  png(filename = "plot2.png", width = 480, height = 480, units = "px")

##plot PM2.5 emmissions data for Baltimore City (BC) for years 1999, 2002, 2005  and 2008 
  #convert year into factor variable
  NEI_BC <- transform(NEI_BC , year = factor(year))
  boxplot(log10(Emissions) ~ year, NEI_BC, xlab = "Year", ylab = expression("log10 "* PM[2.5]), 
        cex.lab=1, main = "Total PM2.5 Emissions for Baltimore City in tons", cex.main=1.3)

##close the PNG file device
  dev.off()