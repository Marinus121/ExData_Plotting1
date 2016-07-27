library(dplyr)

setwd("~/MARINUS/Coursera/exdata_data_household_power_consumption")

HHpcon <- read.table("household_power_consumption.txt"
                     ,sep = ";",header = TRUE
                     ,na.strings = "?")

HHpcon$Date = as.Date(HHpcon$Date,"%d/%m/%Y")

HHPC = filter(HHpcon,Date == "2007-02-01" | Date == "2007-02-02")

HHPC$DateTime = as.POSIXct(paste(HHPC$Date, HHPC$Time), format="%Y-%m-%d %H:%M:%S")

par(mfcol=c(2,2),mar=c(4,4,4,4))

plot(HHPC$DateTime,HHPC$Global_active_power,type="l"
     ,ylab = "Global Active Power (kilowatts)"
     ,xlab ="")

plot(HHPC$DateTime,HHPC$Sub_metering_1,type="l"
     ,ylab = "Energy sub metering"
     ,xlab ="")

points(HHPC$DateTime,HHPC$Sub_metering_2,type="l"
       ,col="Red"
       ,ylab = "Energy sub metering"
       ,xlab ="")

points(HHPC$DateTime,HHPC$Sub_metering_3,type="l"
       ,col="blue"
       ,ylab = "Energy sub metering"
       ,xlab ="")

legend("topright",lty=c(1,1),col=c("black","blue","red")
       ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,cex=0.4)

plot(HHPC$DateTime,HHPC$Voltage,type="l"
     ,ylab = "Voltage"
     ,xlab ="datetime")

plot(HHPC$DateTime,HHPC$Global_reactive_power,type="l"
     ,ylab = "Global_reactive_power"
     ,xlab ="datetime")

dev.copy(png,file="plot4.png")
dev.off(4)