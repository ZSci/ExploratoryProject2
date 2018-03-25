data <- readRDS("summarySCC_PM25.rds")
code <- readRDS("Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)

relevSCC <- code[code$Data.Category == "Onroad", c("SCC", "Data.Category")]
relevdata <- data[data$SCC %in% relevSCC$SCC & data$fips %in% c("24510", "06037"), ]

emits_yr_type <- relevdata %>% filter(fips %in% c("06037", "24510")) %>% group_by(fips, year) %>% summarize(pm_lvl = sum(Emissions))

png("plot6.png")
ggplot(emits_yr_type, aes(factor(fips), pm_lvl, fill = factor(year))) + geom_bar(stat = "identity", position = "dodge")
dev.off()