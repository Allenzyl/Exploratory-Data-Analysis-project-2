#Q4 Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
library(ggplot2)
library(dplyr)
combustion.coal <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
combustion.coal.sources <- SCC[combustion.coal,]
emissions.coal.combustion <- NEI[(NEI$SCC %in% combustion.coal.sources$SCC), ]
emissions.coal.related <- summarise(group_by(emissions.coal.combustion, year), Emissions=sum(Emissions))
png("plot4.png", width=800, height=600)

ggplot(emissions.coal.related, aes(x=factor(year), y=Emissions/1000,fill=year, label = round(Emissions/1000,2))) +
  geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression("total PM"[2.5]*" emissions in kilotons")) +
  ggtitle("Emissions from coal combustion-related sources in kilotons")+
  geom_label(aes(fill = year),colour = "white")
