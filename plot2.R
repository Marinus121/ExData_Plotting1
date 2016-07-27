library(dplyr)

setwd("~/MARINUS/Coursera/exdata_data_household_power_consumption")

HHpcon <- read.table("household_power_consumption.txt"
                     ,sep = ";",header = TRUE
                     ,na.strings = "?")

HHpcon$Date = as.Date(HHpcon$Date,"%d/%m/%Y")

HHPC = filter(HHpcon,Date == "2007-02-01" | Date == "2007-02-02")

HHPC$DateTime = as.POSIXct(paste(HHPC$Date, HHPC$Time), format="%Y-%m-%d %H:%M:%S")

plot(HHPC$DateTime,HHPC$Global_active_power,type="l"
     ,ylab = "Global Active Power (kilowatts)"
     ,xlab ="")

dev.copy(png,file="plot2.png")
dev.off(4)