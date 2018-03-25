##############################################
#
#	Title:		PM2.5 Emissions by year for motor vehicles in Baltimore 
#	Author:		Kalyan
#	Platform:	R(3.4.3) x86_64-w64-mingw32/x64 (64-bit)
#	Date:		26 March 2018
#	
#	Description: 
#	- Reads the dataset for PM2.5 matter
#	- Plots PM2.5 emitted by year for vehicular sources
#
##############################################


#Read data
data <- readRDS("summarySCC_PM25.rds")
code <- readRDS("Source_Classification_Code.rds")

#subset and sum year-wise for vehicular sources in Baltimore
relevSCC <- code[code$Data.Category == "Onroad", c("SCC", "Data.Category")]
relevdata <- data[data$SCC %in% relevSCC$SCC & data$fips == "24510", ]

pm_sum_yr <- tapply(relevdata$Emissions, factor(relevdata$year), sum)

#make the plot
png("plot5.png")
barplot(pm_sum_yr, c(1999, 2002, 2005, 2005, 2008), main = "PM2.5 Emissions by year for motor vehicles in Baltimore ", xlab = "Year", ylab = "PM2.5 Emitted", col = "grey20")
dev.off()
