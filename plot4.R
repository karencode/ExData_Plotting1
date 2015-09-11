setwd("/Users/karen/Coursera/Data")
library(lubridate)
data <- read.table("household_power_consumption.txt",header=TRUE, sep=";", nrows = 2075270,na.strings="?")
x <-paste(data$Date, data$Time)
data$DateTime<-strptime(x,"%d/%m/%Y %H:%M:%S")
data<-data[year(data$DateTime)==2007 & month(data$DateTime)==2 & (day(data$DateTime)==1|day(data$DateTime)==2),]

setwd("/Users/karen/ExData_Plotting1/ExData_Plotting1")

png(file="plot4.png",height=480,width=480)
par(mfrow=c(2,2),ps=12)

#First Plot
with(data,plot(DateTime,Global_active_power,type="l",ylab="Global Active Power",xlab=""))

#Second Plot
#Note: I added a xlabel to this graph, while one isn't appearing for the first and third plots.
#Personally, I think this should be consistent, but I've done this to make my plot match the classes.
with(data,plot(DateTime,Voltage,type="l",xlab="datetime",ylab="Voltage"))

#Third Plot
with(data,plot(DateTime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(data,lines(DateTime,Sub_metering_2,type="l",col="red"))
with(data,lines(DateTime,Sub_metering_3,type="l",col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),names(data)[7:9], bty="n",pt.cex=1, cex=0.85)

#Fourth Plot
#Note: I would not have chosen to write the y label out nicely, but have done it as the samples show.
with(data,plot(DateTime,Global_reactive_power,type="l",xlab="datetime"))

dev.off()
par(mfrow=c(1,1))
