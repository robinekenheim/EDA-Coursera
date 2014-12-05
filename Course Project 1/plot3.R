# Clear old saved variables, set working directory
rm(list=ls())
setwd("C:/Users/roek0_000/Dropbox/Coursera/John Hopkins University/Exploratory Data Analysis/Course Project 1")

# Load, Clean, Deal with time, and selected dates
data <- read.csv("household_power_consumption.txt", sep=";")
subData <- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007"))
subData$Date <- as.Date(strptime(subData$Date,"%d/%m/%Y"))
subData$Global_active_power <- as.numeric(as.character(subData$Global_active_power))
subData$Date <- strptime(paste(subData$Date, subData$Time, sep = " "),"%Y-%m-%d %H:%M:%S")


#Plot
png(filename="plot3.png", width = 480, height = 480)
plot(subData$Date, as.numeric(as.character(subData$Sub_metering_1)), "l", ylab="Energy sub metering", xlab="")
lines(subData$Date, as.numeric(as.character(subData$Sub_metering_2)), "l", col="red")
lines(subData$Date, as.numeric(as.character(subData$Sub_metering_3)), "l", col="blue")
legend("topright", lty=c(1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
