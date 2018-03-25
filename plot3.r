##############################################
#
#	Title:		PM2.5 Emissions by year and type in Baltimore
#	Author:		Kalyan
#	Platform:	R(3.4.3) x86_64-w64-mingw32/x64 (64-bit)
#	Date:		26 March 2018
#	
#	Description: 
#	- Reads the dataset for PM2.5 matter
#	- Plots PM2.5 emitted by year for different source types
#
##############################################


#Read data
data <- readRDS("summarySCC_PM25.rds")
library(dplyr)
library(ggplot2)

#subset and sum year-wise for Baltimore and group by type
emits_yr_type <- data %>% filter(fips == "24510") %>% group_by(type, year) %>% summarize(pm_lvl = sum(Emissions))

#make the plot
png("plot3.png")
ggplot(emits_yr_type, aes(factor(type), pm_lvl, fill = factor(year))) + geom_bar(stat = "identity", position = "dodge")
dev.off()