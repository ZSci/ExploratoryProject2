data <- readRDS("summarySCC_PM25.rds")

fact_yr <- factor(data$year)
pm_sum_yr <- tapply(data$Emissions, fact_yr, sum)

png("plot1.png")
barplot(pm_sum_yr, c(1999, 2002, 2005, 2008), main = "PM2.5 Emissions by year", xlab = "Year", ylab = "PM2.5 Emitted")
dev.off()