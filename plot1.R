# read rough d1 subset having needed data
d <- read.csv("household_power_consumption.txt", sep=";", quote="", na.strings="?", nrows = 70000)
# filter out d2 data subset
d2 <- d[d$Date == "1/2/2007" | d$Date == "2/2/2007",]
# open png graph device
png(filename = "plot1.png", width = 480, height = 480, units = "px")
# create histogram
hist(d2$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
# finish
dev.off()