##############################################
#
#	Title:		PM2.5 Emissions by year
#	Author:		Kalyan
#	Platform:	R(3.4.3) x86_64-w64-mingw32/x64 (64-bit)
#	Date:		26 March 2018
#	
#	Description: 
#	- Reads the dataset for PM2.5 matter
#	- Plots PM2.5 emitted by year
#
##############################################

#Read data
data <- readRDS("summarySCC_PM25.rds")

#subset and sum year-wise
fact_yr <- factor(data$year)
pm_sum_yr <- tapply(data$Emissions, fact_yr, sum)

#make the plot
png("plot1.png")
barplot(pm_sum_yr, c(1999, 2002, 2005, 2008), main = "PM2.5 Emissions by year", xlab = "Year", ylab = "PM2.5 Emitted")
dev.off()