setwd("/Users/karen/Coursera/Data")
library(lubridate)
data <- read.table("household_power_consumption.txt",header=TRUE, sep=";", nrows = 2075270,na.strings="?")
x <-paste(data$Date, data$Time)
data$DateTime<-strptime(x,"%d/%m/%Y %H:%M:%S")
data<-data[year(data$DateTime)==2007 & month(data$DateTime)==2 & (day(data$DateTime)==1|day(data$DateTime)==2),]

setwd("/Users/karen/ExData_Plotting1/ExData_Plotting1")
png(file="plot3.png",height=480,width=480)
par(ps=13)
with(data,plot(DateTime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(data,lines(DateTime,Sub_metering_2,type="l",col="red"))
with(data,lines(DateTime,Sub_metering_3,type="l",col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),names(data)[7:9])


dev.off()
