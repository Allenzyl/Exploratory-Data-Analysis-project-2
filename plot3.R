#Q3 Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
#Which have seen increases in emissions from 1999-2008? 
#Use the ggplot2 plotting system to make a plot answer this question.
library(ggplot2)
library(dplyr)
png("plot3.png", width=800, height=600)
baltcitymary.emissions.byyear<-summarise(group_by(filter(NEI, fips == "24510"), year,type), Emissions=sum(Emissions))
ggplot(baltcitymary.emissions.byyear, aes(x=factor(year),fill=type, y=Emissions,label = round(Emissions))) +
  geom_bar(stat="identity") +
  facet_grid(. ~ type) +
  xlab("Year") +
  ylab(expression("total PM"[2.5]*" emission in tons")) +
  ggtitle(expression("PM"[2.5]*paste(" emissions in Baltimore ","City by various source types", sep=""))) +
  geom_label(aes(fill = type), colour = "white")

