rm(list=ls())
library(ggplot2)
library(dplyr)
setwd("C:/Users/roek0_000/Dropbox/Coursera/John Hopkins University/Exploratory Data Analysis/Course Project 2")

# Read Data into R:
data <- readRDS("C:/Users/roek0_000/Dropbox/Coursera/John Hopkins University/Data Folder/summarySCC_PM25.rds")
class <- readRDS("C:/Users/roek0_000/Dropbox/Coursera/John Hopkins University/Data Folder/Source_Classification_Code.rds")


engine <- c('Mobile - On-Road Gasoline Light Duty Vehicles', 'Mobile - On-Road Gasoline Heavy Duty Vehicles',
          'Mobile - On-Road Diesel Light Duty Vehicles', 'Mobile - On-Road Diesel Heavy Duty Vehicles')


# Filter Data and get SSC number
uniqueClass = unique(class$SCC[class$EI.Sector %in% motor])
engineData = data[data$SCC %in% uniqueClass & data$fips %in% c('24510', '06037'), ]

# Sum of vehicle emission by year and fips. Set labels.
totals = engineData %>%  group_by(year, fips) %>% summarize(emissions = sum(Emissions))
totals$location = ifelse(totals$fips == '24510', 'Baltimore City', 'LA County')


# create plot
png(filename = 'plot6.png', width=800, height = 600)
ggplot(totals, aes(x = factor(year), y = emissions, fill = location)) +
        geom_bar(stat = 'identity', position = 'dodge') +
        ggtitle('Baltimore City vs. LA County \n1999-2008') +
        xlab('year') + ylab('PM Emissions (tons)')
dev.off()
