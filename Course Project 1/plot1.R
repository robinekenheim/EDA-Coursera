# Clear old saved variables, set working directory
rm(list=ls())
setwd("C:/Users/roek0_000/Dropbox/Coursera/John Hopkins University/Exploratory Data Analysis/Course Project 1")

# Load, Clean, Deal with time, and selected dates
data <- read.csv("household_power_consumption.txt", sep=";")
subData <- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007"))
subData$Date <- as.Date(strptime(subData$Date,"%d/%m/%Y"))
subData$Global_active_power <- as.numeric(as.character(subData$Global_active_power))

# Histogram
hist(subData$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

# Plot data
png(filename="plot1.png", width = 480, height = 480)
hist(subData$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
