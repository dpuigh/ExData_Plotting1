# Exploratory Data Analysis
# Course Project 1
# R code creates plot of sub_metering vs time

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
png(filename="plot3.png", width=480, height=480, units="px")
# create scatterplot with settings / annotations
plot(subData$TimeStamp, subData$Sub_metering_1, 
     xlab="", ylab="Energy sub metering", type="n")
# draw lines between points
lines(subData$TimeStamp, subData$Sub_metering_1, col="black")
lines(subData$TimeStamp, subData$Sub_metering_2, col="red")
lines(subData$TimeStamp, subData$Sub_metering_3, col="blue")
# add legend
legend("topright", col=c("black","red","blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       lty=1, lwd=1, cex=0.93)
# close graphics device
dev.off()