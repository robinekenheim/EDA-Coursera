rm(list=ls())
require(ggplot2)
setwd("C:/Users/roek0_000/Dropbox/Coursera/John Hopkins University/Exploratory Data Analysis/Course Project 2")

# Read Data into R:
data <- readRDS("C:/Users/roek0_000/Dropbox/Coursera/John Hopkins University/Data Folder/summarySCC_PM25.rds")
class <- readRDS("C:/Users/roek0_000/Dropbox/Coursera/John Hopkins University/Data Folder/Source_Classification_Code.rds")
data$year <- factor(data$year, levels = c('1999', '2002', '2005', '2008'))

# Baltimore City, Maryland == fips
MD.onroad <- subset(data, fips == 24510 & type == 'ON-ROAD')

# Aggregates
MD.df <- aggregate(MD.onroad[, 'Emissions'], by = list(MD.onroad$year), sum)
colnames(MD.df) <- c('year', 'Emissions')

png('plot5.png')
ggplot(data = MD.df, aes(x = year, y = Emissions)) + 
        geom_bar(aes(fill = year), stat = "identity") +
        guides(fill = F) + 
        ggtitle('Total Emissions of Motor Vehicle Sources in Baltimore City, Maryland') +
        ylab(expression('PM'[2.5])) +
        xlab('Year') + 
        theme(legend.position = 'none') +
        geom_text(aes(label = round(Emissions, 0), size = 1, hjust = 0.5, vjust = 2))
dev.off()
