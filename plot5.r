data <- readRDS("summarySCC_PM25.rds")
code <- readRDS("Source_Classification_Code.rds")

relevSCC <- code[code$Data.Category == "Onroad", c("SCC", "Data.Category")]
relevdata <- data[data$SCC %in% relevSCC$SCC & data$fips == "24510", ]

pm_sum_yr <- tapply(relevdata$Emissions, factor(relevdata$year), sum)

png("plot5.png")
barplot(pm_sum_yr, c(1999, 2002, 2005, 2005, 2008), main = "PM2.5 Emissions by year for motor vehicles in Baltimore ", xlab = "Year", ylab = "PM2.5 Emitted", col = "grey20")
dev.off()
