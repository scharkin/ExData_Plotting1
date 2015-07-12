# read rough d subset having needed data
d <- read.csv("household_power_consumption.txt", sep=";", quote="", na.strings="?", nrows = 70000)

# filter out d2 data subset
d2 <- d[d$Date == "1/2/2007" | d$Date == "2/2/2007",]

# combine date and time
datetime <- as.POSIXct(paste(d2$Date, d2$Time), format="%d/%m/%Y %H:%M:%S")

# open png graph device
png(filename = "plot4.png", width = 480, height = 480, units = "px")

#set grid
par(mfrow = c(2,2))

# create graphs
plot(datetime, d2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(datetime, d2$Voltage, type = "l", ylab = "Voltage")

plot(datetime, d2$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, d2$Sub_metering_2, type = "l", col = "red")
lines(datetime, d2$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = "solid", col = c("black","red","blue"), bty="n", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(datetime, d2$Global_reactive_power, type = "l", ylab = "Global_reactive_power")

# finish
dev.off()
