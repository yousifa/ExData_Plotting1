# plot1.R to plot global active power

## Read and subset data for proper dates
data <- read.table('household_power_consumption.txt',na.strings="?",header=T,sep=";",colClasses=c('character','character','numeric',
          'numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric'))
data$DateTime <- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")
plotData <- subset(data,as.Date(DateTime) <= as.Date("2007-02-02") & as.Date(DateTime) >= as.Date("2007-02-01"))

## Build plot and save png
png("plot1.png",height=504,width=504,bg="transparent")
hist(plotData$Global_active_power,col="Red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()