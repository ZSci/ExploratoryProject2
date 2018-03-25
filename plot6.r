##############################################
#
#	Title:		PM2.5 Emissions by year for motor vehicles in Baltimore and LA
#	Author:		Kalyan
#	Platform:	R(3.4.3) x86_64-w64-mingw32/x64 (64-bit)
#	Date:		26 March 2018
#	
#	Description: 
#	- Reads the dataset for PM2.5 matter
#	- Plots PM2.5 emitted by year for vehicular sources in Baltimore and LA
#
##############################################

#Read data
data <- readRDS("summarySCC_PM25.rds")
code <- readRDS("Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)

#subset and sum year-wise for vehicular sources in Baltimore and LA
relevSCC <- code[code$Data.Category == "Onroad", c("SCC", "Data.Category")]
relevdata <- data[data$SCC %in% relevSCC$SCC & data$fips %in% c("24510", "06037"), ]

emits_yr_type <- relevdata %>% filter(fips %in% c("06037", "24510")) %>% group_by(fips, year) %>% summarize(pm_lvl = sum(Emissions))

#make the plot
png("plot6.png")
ggplot(emits_yr_type, aes(factor(fips), pm_lvl, fill = factor(year))) + geom_bar(stat = "identity", position = "dodge")
dev.off()