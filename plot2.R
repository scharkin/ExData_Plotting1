# read rough d subset having needed data
d <- read.csv("household_power_consumption.txt", sep=";", quote="", na.strings="?", nrows = 70000)
# filter out d2 data subset
d2 <- d[d$Date == "1/2/2007" | d$Date == "2/2/2007",]
# make x from date and time
x <- as.POSIXct(paste(d2$Date, d2$Time), format="%d/%m/%Y %H:%M:%S")
# open png graph device
png(filename = "plot2.png", width = 480, height = 480, units = "px")
# create graph
plot(x, d2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
# finish
dev.off()
