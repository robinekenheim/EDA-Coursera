rm(list=ls())
setwd("C:/Users/roek0_000/Dropbox/Coursera/John Hopkins University/Exploratory Data Analysis/Course Project 2")

# Read Data into R:
data <- readRDS("C:/Users/roek0_000/Dropbox/Coursera/John Hopkins University/Data Folder/summarySCC_PM25.rds")
class <- readRDS("C:/Users/roek0_000/Dropbox/Coursera/John Hopkins University/Data Folder/Source_Classification_Code.rds")

bc = data[data$fips == '24510' & data$year %in% c(1999, 2008), ]
dataSample = tapply(bc$Emissions, bc$year, sum)

# create barplot
png(filename='plot2.png', width=480, height = 480)
barplot(dataSample, 
        main = 'Total Emissions by Year', 
        ylab = 'PM Emitted (tons)',
        xlab = 'Year',
        col = topo.colors(4))
dev.off()
