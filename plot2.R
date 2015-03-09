# Exploratory Data Analysis
# Course Project 1
# R code creates plot of Global Active Power (kW) vs time

# Get the data
fileName <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(fileName, temp, method="curl") #using curl for mac
data <- read.table(unz(temp, "household_power_consumption.txt"),
                   sep = ";", header = TRUE, na.strings = "?")
unlink(temp)

# coercion for date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# subset data to range of interest
subData <- subset(data, 
                  Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02") )
# create timestampe column
subData$TimeStamp <- strptime(
    paste(subData$Date,subData$Time,sep=" "), "%Y-%m-%d %H:%M:%S")

# open graphics device
png(filename="plot2.png", width=480, height=480, units="px")
# create scatterplot with settings / annotations
plot(subData$TimeStamp, subData$Global_active_power, 
     xlab="", ylab="Global Active Power (kilowatts)", type="n")
# draw lines between points
lines(subData$TimeStamp, subData$Global_active_power)
# close graphics device
dev.off()