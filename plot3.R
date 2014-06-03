# How much memory is required to store my dataset of 2,075,259 rows?
((2075259*120*8)/(2^20))/1000
# 1.9 GB is required

# Reading the data (It will take a few minutes), validating the number of rows and columns, and summarizing statistics
# Our data must be stored in the default working directory in order to run this script
getwd()
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
str(data)
summary(data)

# Subset the data on specific Dates and validating observations
datafinal <- subset(data, Date =="1/2/2007" | Date == "2/2/2007")
str(datafinal)
summary(datafinal)

# Transforming Data and Time variables in order to create plot 3. First, install lubridate package
library(lubridate)
datafinal$DateTime <- paste(datafinal$Date, datafinal$Time)
datafinal$DataTimeCorrect <- dmy_hms(datafinal$DateTime)

# Changing my local time in order to get english labels
Sys.setlocale("LC_TIME", "english")

# Building plot 3
plot(datafinal$DataTimeCorrect,datafinal$Sub_metering_1, xlab="", ylab="Energy sub metering", type="n")
lines(datafinal$DataTimeCorrect,datafinal$Sub_metering_1, col="black")
lines(datafinal$DataTimeCorrect,datafinal$Sub_metering_2, col="red")
lines(datafinal$DataTimeCorrect,datafinal$Sub_metering_3, col="blue")
legend("topright", pch="_", cex=0.8, col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Storing the plot in .png format (This file will be stored by 480x480 pixeles by default)
dev.copy(png, file = "plot3.png")
dev.off()
