# use ggplot2
library(ggplot2)

# read data
d <- readRDS("summarySCC_PM25.rds")

# filter out d2 data subset for Baltimore City, Maryland
d2 <- d[d$fips == 24510,]

# aggregate emissions for Baltimore City by year and type
r <- aggregate(d2$Emissions, list(year = d2$year, type=d2$type), sum)

# open png graph device
png(filename = "plot3.png", width = 480, height = 480, units = "px")

# create graph
ggplot(r, aes(factor(year), x, fill = type)) +
    geom_bar(stat="identity", position="dodge") +
    labs(title = "PM2.5 emissions in the Baltimore City, Maryland",
    	y = "PM2.5 emission, tons", x = "Years")
# finish
dev.off()
