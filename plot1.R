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

# Building plot 1
hist(datafinal$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (Kilowatts)")

# Storing the plot in .png format (This file will be stored by 480x480 pixeles by default)
dev.copy(png, file = "plot1.png")
dev.off()