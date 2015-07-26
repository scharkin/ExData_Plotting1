# use ggplot2
library(ggplot2)

# read all data
d <- readRDS("summarySCC_PM25.rds")

# filter out data subset having Baltimore City, Maryland
# and Los Angeles County, California
d2 <- d[d$fips == "24510" | d$fips == "06037",]

# filter out data subset for vehicles
d3 <- d2[d2$type == "ON-ROAD",]

# aggregate emissions for vehicles by year and fips
r <- aggregate(d2$Emissions, list(year = d2$year, fips=d2$fips), sum)

# open png graph device
png(filename = "plot6.png", width = 480, height = 480, units = "px")

# create graph
ggplot(r, aes(factor(year), x, fill = factor(fips,labels=c("Los Angeles, CA","Baltimore, MD")))) +
    geom_bar(stat="identity", position="dodge") +
    labs(title = "Emissions from motor vehicles",
         y = "Emissions, tons", x = "Years", fill = "Cities")
# finish
dev.off()
