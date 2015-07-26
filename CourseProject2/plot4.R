# use ggplot2
library(ggplot2)

# read data
d <- readRDS("summarySCC_PM25.rds")

# read source classification codes
SCC <- readRDS("Source_Classification_Code.rds")

# find codes for coal combustion-related sources
indices <- grep("coal", SCC$EI.Sector, ignore.case=T)
rows <- as.character(SCC$SCC[indices])

# filter out d2 data subset with coal combustion-related sources
d2 <- d[d$SCC %in% rows,]

# aggregate coal combustion-related emissions by year
r <- aggregate(d2$Emissions, list(year = d2$year), sum)

# open png graph device
png(filename = "plot4.png", width = 480, height = 480, units = "px")

# create graph
ggplot(r, aes(factor(year), x)) +
    geom_bar(stat="identity", position="dodge") +
    labs(title = "Total coal combustion-related emissions in the United States",
         y = "Emissions, tons", x = "Years")
# finish
dev.off()
