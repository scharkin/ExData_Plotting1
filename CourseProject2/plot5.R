# use ggplot2
library(ggplot2)

# read data
d <- readRDS("summarySCC_PM25.rds")

# filter out d2 data subset for vehicles in the Baltimore City, Maryland
d2 <- d[d$fips == 24510 & d$type == "ON-ROAD",]

# aggregate emissions for vehicles in the Baltimore City by year
r <- aggregate(d2$Emissions, list(year = d2$year), sum)

# open png graph device
png(filename = "plot5.png", width = 480, height = 480, units = "px")

# create graph
ggplot(r, aes(factor(year), x)) + geom_bar(stat="identity") +
    labs(title = "Emissions from motor vehicles in the Baltimore City, Maryland",
    	y = "Emissions from motor vehicle, tons", x = "Years")
# finish
dev.off()
