data <- readRDS("summarySCC_PM25.rds")
library(dplyr)
library(ggplot2)

emits_yr_type <- data %>% filter(fips == "24510") %>% group_by(type, year) %>% summarize(pm_lvl = sum(Emissions))

png("plot3.png")
ggplot(emits_yr_type, aes(factor(type), pm_lvl, fill = factor(year))) + geom_bar(stat = "identity", position = "dodge")
dev.off()