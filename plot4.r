##############################################
#
#	Title:		PM2.5 Emissions by year for coal combustion related
#	Author:		Kalyan
#	Platform:	R(3.4.3) x86_64-w64-mingw32/x64 (64-bit)
#	Date:		26 March 2018
#	
#	Description: 
#	- Reads the dataset for PM2.5 matter
#	- Plots PM2.5 emitted by year for coal combustion types
#
##############################################


#Read data
data <- readRDS("summarySCC_PM25.rds")
code <- readRDS("Source_Classification_Code.rds")

#subset and sum year-wise for coal combustion
relevSCC <- code[grepl("[Cc]omb", code$Short.Name) & grepl("Coal", code$Short.Name), "SCC"]
relevdata <- data[data$SCC %in% relevSCC, ]

pm_sum_yr <- tapply(relevdata$Emissions, factor(relevdata$year), sum)

#make the plot
png("plot4.png")
barplot(pm_sum_yr, c(1999, 2002, 2005, 2005, 2008), main = "PM2.5 Emissions by year for coal combustion related", xlab = "Year", ylab = "PM2.5 Emitted", col = "grey20")
dev.off()
