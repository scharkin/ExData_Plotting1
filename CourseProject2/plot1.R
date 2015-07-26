# read data
d <- readRDS("summarySCC_PM25.rds")

# aggregate emissions by year
r <- aggregate(d$Emissions, list(year = d$year), sum)

# open png graph device
png(filename = "plot1.png", width = 480, height = 480, units = "px")

# create graph
barplot(r$x, names = r$year, xlab = "Years",
	ylab = "Emissions, tons",
	main = "Total emissions from PM2.5 in the United States\ndecreased from 1999 to 2008")

# finish
dev.off()
