library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Q1 Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from all 
#sources for each of the years 1999, 2002, 2005, and 2008.
png("plot1.png", width=800, height=600)
total.emissions <- summarise(group_by(NEI, year), Emissions=sum(Emissions))
barplot(height=total.emissions$Emissions/1000, names.arg=total.emissions$year,
            xlab="years", ylab=expression('total PM'[2.5]*' emission in kilotons'),ylim=c(0,8000),
            main=expression('Total PM'[2.5]*' emissions at various years in kilotons'))

