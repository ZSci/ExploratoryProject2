data <- readRDS("summarySCC_PM25.rds")

fact_yr <- factor(data$year)
balt_read <- data["fips"] == "24510"
balt_emits <- tapply(data[balt_read, "Emissions"], fact_yr[balt_read], sum)

png("plot2.png")
barplot(balt_emits, c(1999, 2002, 2005, 2005, 2008), main = "PM2.5 Emissions by year in Baltimore", xlab = "Year", ylab = "PM2.5 Emitted", col = "aquamarine")
dev.off()