# plot4.R to plot global active power multiplot

## Read and subset data for proper dates
data <- read.table('household_power_consumption.txt',na.strings="?",header=T,sep=";",colClasses=c('character','character','numeric',
          'numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric'))
data$DateTime <- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")
plotData <- subset(data,as.Date(DateTime) <= as.Date("2007-02-02") & as.Date(DateTime) >= as.Date("2007-02-01"))

## Build plot and save png
png("plot4.png",height=504,width=504,bg="transparent")
par(mfrow=c(2,2))

plot(plotData$DateTime,plotData$Global_active_power,pch=NA,ylab="Global Active Power",xlab="")
lines(plotData$DateTime,plotData$Global_active_power)

plot(plotData$DateTime,plotData$Voltage,xlab="datetime",ylab="Voltage",pch=NA)
lines(plotData$DateTime, plotData$Voltage)

plot(plotData$DateTime,plotData$Sub_metering_1,pch=NA,ylab="Energy sub metering",xlab="")
lines(plotData$DateTime,plotData$Sub_metering_1,col="Black")
lines(plotData$DateTime,plotData$Sub_metering_2,col="Red")
lines(plotData$DateTime,plotData$Sub_metering_3,col="Blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("Black", "Red", "blue"),lty=c(1,1,1))

with(plotData,plot(DateTime,Global_reactive_power,pch=NA,xlab="datetime"))
with(plotData,lines(DateTime,Global_reactive_power))

dev.off()