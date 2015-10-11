url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "data.zip")
unzip("data.zip")

hpcdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
hpcdata$Date <- as.Date(hpcdata$Date, "%d/%m/%Y")
hpcdata$Time <- paste(hpcdata$Date, hpcdata$Time)
hpcdata$Time <- strptime(hpcdata$Time, format = "%Y-%m-%d %H:%M:%S")
hpcdata <- subset.data.frame(hpcdata, hpcdata$Date == as.Date(as.character("2007-02-01")) | 
                               hpcdata$Date == as.Date(as.character("2007-02-02")))

png("plot4.png")
par(mfrow = c(2,2))
##Plot1
plot(hpcdata$Time, hpcdata$Global_active_power, type = "n", 
     ylab = "Global Active Power", xlab = "")
lines(hpcdata$Time, hpcdata$Global_active_power)
##Plot2
plot(hpcdata$Time, hpcdata$Voltage, type = "n", 
     ylab = "Voltage", xlab = "datetime")
lines(hpcdata$Time, hpcdata$Voltage)
##Plot3
with(hpcdata, {
  plot (hpcdata$Time, hpcdata$Sub_metering_1, type = "n", ylab = "Energy sub Metering", xlab = "")
  lines(hpcdata$Time, hpcdata$Sub_metering_1)
  lines(hpcdata$Time, hpcdata$Sub_metering_2, col = "Red")
  lines(hpcdata$Time, hpcdata$Sub_metering_3, col = "Blue")
  legend("topright", col = c("Black", "Red", "Blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1, lty = 1)
})
##Plot4
plot(hpcdata$Time, hpcdata$Global_reactive_power, type = "n", 
     ylab = "Global_reactive_power", xlab = "datetime")
lines(hpcdata$Time, hpcdata$Global_reactive_power)

dev.off()

