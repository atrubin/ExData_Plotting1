#setwd("~/Documents/R/Coursera/Exploratory")

ReadData <- function(x)
{
    HHPowConsumption <- read.csv2("household_power_consumption.txt", 
                                  header=TRUE, 
                                  stringsAsFactors=FALSE,
                                  na.strings = '?')
    
    r <- HHPowConsumption[ HHPowConsumption$Date == '1/2/2007' | 
                               HHPowConsumption$Date == '2/2/2007', ]    
    
    r$TimeStamp <- strptime(as.character(paste(r$Date,r$Time,sep=" ")), 
                            format="%d/%m/%Y %H:%M:%S")
    r
}

HHPowConsumption <- ReadData("household_power_consumption.txt")


png(filename='plot2.png', width=480, height=480, bg = "transparent")

par(mfrow=c(2,2))

with(data, {
    plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
    plot(datetime, Voltage, ylab="Voltage", type="l")
    plot(datetime, Sub_metering_1, type="l", col="black",
         xlab="",ylab="Energy sub metering")
    lines(datetime, Sub_metering_2, col="red")
    lines(datetime, Sub_metering_3, col="blue")
    legend("topright", bty="n", lty=1,col = c("black","red","blue"), 
           legend = names(data[,6:8]))
    plot(datetime, Global_reactive_power, type="l")
})


dev.off()
