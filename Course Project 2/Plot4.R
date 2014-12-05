rm(list=ls())
require(ggplot2)
setwd("C:/Users/roek0_000/Dropbox/Coursera/John Hopkins University/Exploratory Data Analysis/Course Project 2")

# Read Data into R:
data <- readRDS("C:/Users/roek0_000/Dropbox/Coursera/John Hopkins University/Data Folder/summarySCC_PM25.rds")
class <- readRDS("C:/Users/roek0_000/Dropbox/Coursera/John Hopkins University/Data Folder/Source_Classification_Code.rds")


# Coal-related SCC
class.coal = class[grepl("coal", class$Short.Name, ignore.case = TRUE), ]

# Merges two data sets
merge <- merge(x = data, y = class.coal, by = 'SCC')
merge.sum <- aggregate(merge[, 'Emissions'], by = list(merge$year), sum)
colnames(merge.sum) <- c('Year', 'Emissions')

# Plot
png(filename = 'plot4.png')
ggplot(data = merge.sum, aes(x = Year, y = Emissions / 1000)) +
        geom_line(aes(group = 1, col = Emissions)) +
        geom_point(aes(size = 2, col = Emissions)) +
        ggtitle(expression('Total Emissions of PM'[2.5])) +
        ylab(expression(paste('PM', ''[2.5], ' in kilotons'))) +
        geom_text(aes(label = round(Emissions / 1000, digits = 2), size = 2, hjust = 1.5, vjust = 1.5)) +
        theme(legend.position = 'none') +
        scale_colour_gradient(low = 'black', high = 'red')
dev.off()
