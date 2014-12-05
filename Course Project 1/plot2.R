# Clear old saved variables, set working directory
rm(list=ls())
setwd("C:/Users/roek0_000/Dropbox/Coursera/John Hopkins University/Exploratory Data Analysis/Course Project 1")

# Load, Clean, Deal with time, and selected dates
data <- read.csv("household_power_consumption.txt", sep=";")
subData <- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007"))
subData$Date <- as.Date(strptime(subData$Date,"%d/%m/%Y"))
subData$Global_active_power <- as.numeric(as.character(subData$Global_active_power))
subData$Date <- strptime(paste(subData$Date, subData$Time, sep = " "),"%Y-%m-%d %H:%M:%S")

# Plot
png("plot2.png", width = 480, height = 480)
plot(subData$Date, subData$Global_active_power, type="l", ylab= "Global Active Power(kilowatts)", xlab="")
dev.off()
