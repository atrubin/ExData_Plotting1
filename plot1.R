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


png(filename='plot1.png', width=480, height=480, bg = "transparent")
hist(as.numeric(HHPowConsumption$Global_active_power), col='red', main="Global Active Power", xlab='Global Active Power (kilowatts)')
dev.off()
