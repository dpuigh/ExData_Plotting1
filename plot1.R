# Exploratory Data Analysis
# Course Project 1
# R code creates histogram of Global Active Power (kW)

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

# open graphics device
png(filename="plot1.png", width=480, height=480, units="px")
# create histogram with settings / annotations
hist(subData$Global_active_power, col="red",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     main="Global Active Power")
# close graphics device
dev.off()