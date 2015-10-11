url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "data.zip")
unzip("data.zip")

hpcdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
hpcdata$Date <- as.Date(hpcdata$Date, "%d/%m/%Y")
hpcdata$Time <- paste(hpcdata$Date, hpcdata$Time)
hpcdata$Time <- strptime(hpcdata$Time, format = "%Y-%m-%d %H:%M:%S")
hpcdata <- subset.data.frame(hpcdata, hpcdata$Date == as.Date(as.character("2007-02-01")) | 
                                hpcdata$Date == as.Date(as.character("2007-02-02")))

png("plot1.png")
hist(hpcdata$Global_active_power, col = "Red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()



