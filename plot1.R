setwd("/Users/karen/Coursera/Data")
library(lubridate)
data <- read.table("household_power_consumption.txt",header=TRUE, sep=";", nrows = 2075270,na.strings="?")
x <-paste(data$Date, data$Time)
data$DateTime<-strptime(x,"%d/%m/%Y %H:%M:%S")
data<-data[year(data$DateTime)==2007 & month(data$DateTime)==2 & (day(data$DateTime)==1|day(data$DateTime)==2),]

par(ps=14)
with(data,hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red"))
setwd("/Users/karen/ExData_Plotting1/ExData_Plotting1")
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()
