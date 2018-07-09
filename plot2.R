#Q2 Have total emissions from PM2.5 decreased in the Baltimore City, Maryland from 1999 to 2008? 
#Use the base plotting system to make a plot answering this question.
png("plot2.png", width=800, height=600)
baltcitymary.emissions<-summarise(group_by(filter(NEI, fips == "24510"), year), Emissions=sum(Emissions))
barplot(height=baltcitymary.emissions$Emissions/1000, names.arg=baltcitymary.emissions$year,
            xlab="years", ylab=expression('total PM'[2.5]*' emission in kilotons'),ylim=c(0,4),
            main=expression('Total PM'[2.5]*' emissions in Baltimore City-MD in kilotons'),col=clrs)
