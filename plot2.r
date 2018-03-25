##############################################
#
#	Title:		PM2.5 Emissions by year in Baltimore
#	Author:		Kalyan
#	Platform:	R(3.4.3) x86_64-w64-mingw32/x64 (64-bit)
#	Date:		26 March 2018
#	
#	Description: 
#	- Reads the dataset for PM2.5 matter
#	- Plots PM2.5 emitted by year in Baltimore city
#
##############################################


#Read data
data <- readRDS("summarySCC_PM25.rds")

#subset and sum year-wise by selecting Baltimore (fips 24510)
fact_yr <- factor(data$year)
balt_read <- data["fips"] == "24510"
balt_emits <- tapply(data[balt_read, "Emissions"], fact_yr[balt_read], sum)

#make the plot
png("plot2.png")
barplot(balt_emits, c(1999, 2002, 2005, 2005, 2008), main = "PM2.5 Emissions by year in Baltimore", xlab = "Year", ylab = "PM2.5 Emitted", col = "aquamarine")
dev.off()