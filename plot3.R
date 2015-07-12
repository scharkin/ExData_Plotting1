# read rough d subset having needed data
d <- read.csv("household_power_consumption.txt", sep=";", quote="", na.strings="?", nrows = 70000)
# filter out d2 data subset
d2 <- d[d$Date == "1/2/2007" | d$Date == "2/2/2007",]
# make x from date and time
x <- as.POSIXct(paste(d2$Date, d2$Time), format="%d/%m/%Y %H:%M:%S")
# open png graph device
png(filename = "plot3.png", width = 480, height = 480, units = "px")
# create graphs
plot(x, d2$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(x, d2$Sub_metering_2, type = "l", col = "red")
lines(x, d2$Sub_metering_3, type = "l", col = "blue")
# describe
legend("topright", lty = "solid", col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# finish
dev.off()
