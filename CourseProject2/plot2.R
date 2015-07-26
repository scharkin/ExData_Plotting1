# read data
d <- readRDS("summarySCC_PM25.rds")

# filter out d2 data subset for Baltimore City, Maryland
d2 <- d[d$fips == "24510",]

# aggregate emissions for Baltimore City by year
r <- aggregate(d2$Emissions, list(year = d2$year), sum)

# open png graph device
png(filename = "plot2.png", width = 480, height = 480, units = "px")

# create graph
barplot(r$x, names = r$year, xlab = "Years", ylab = "Emissions, tons",
	main = "Total emissions from PM2.5 in the Baltimore City, Maryland")

# finish
dev.off()
