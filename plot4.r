
data <- readRDS("summarySCC_PM25.rds")
code <- readRDS("Source_Classification_Code.rds")

relevSCC <- code[grepl("[Cc]omb", code$Short.Name) & grepl("Coal", code$Short.Name), "SCC"]
relevdata <- data[data$SCC %in% relevSCC, ]

pm_sum_yr <- tapply(relevdata$Emissions, factor(relevdata$year), sum)

png("plot4.png")
barplot(pm_sum_yr, c(1999, 2002, 2005, 2005, 2008), main = "PM2.5 Emissions by year for coal combustion related", xlab = "Year", ylab = "PM2.5 Emitted", col = "grey20")
dev.off()
