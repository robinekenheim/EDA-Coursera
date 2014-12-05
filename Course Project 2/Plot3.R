rm(list=ls())
require(ggplot2)
require(dplyr)
setwd("C:/Users/roek0_000/Dropbox/Coursera/John Hopkins University/Exploratory Data Analysis/Course Project 2")

# Read Data into R:
data <- readRDS("C:/Users/roek0_000/Dropbox/Coursera/John Hopkins University/Data Folder/summarySCC_PM25.rds")
class <- readRDS("C:/Users/roek0_000/Dropbox/Coursera/John Hopkins University/Data Folder/Source_Classification_Code.rds")


# Filter non-Baltimore City data
bc = data[data$fips == '24510', ]

# Sum of Emission per Year
dataSample = bc %.%
        group_by(type, year) %.%
        summarize(emissions = sum(Emissions))

# Plot
png(filename='plot3.png', width=800, height = 500)
ggplot(dataSample, aes(x = factor(year), y = emissions, fill = type)) + 
        geom_bar(stat = 'identity') + facet_grid(. ~ type) +
        theme_bw() + 
        theme(legend.position = 'none') + 
        xlab('year') + ylab('PM Emitted (tons)') +
        ggtitle('Baltimore City emissions by Source')

dev.off()

