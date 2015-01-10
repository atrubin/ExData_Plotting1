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


png(filename='plot4.png', width=480, height=480, bg = "transparent")

par(mfrow=c(2,2))

with(HHPowConsumption, {
    plot(TimeStamp, Global_active_power, type = 'l', xlab = "", 
         ylab = "Global Active Power")
    
    plot(TimeStamp, Voltage, ylab="Voltage", type="l", xlab = 'datetime')
    
    plot(TimeStamp, Sub_metering_1, type='l', col="black",
         xlab="",ylab="Energy sub metering")
    lines(TimeStamp, Sub_metering_2, col="red")
    lines(TimeStamp, Sub_metering_3, col="blue")
    legend("topright", bty="n", lty=1,col = c("black","red","blue"), 
           legend = names(HHPowConsumption[,7:9]))
    
    
    plot(TimeStamp, Global_reactive_power, type='l', xlab = 'datetime')
})



dev.off()
