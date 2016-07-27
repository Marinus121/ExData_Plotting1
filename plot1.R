library(dplyr)

setwd("~/MARINUS/Coursera/exdata_data_household_power_consumption")

HHpcon <- read.table("household_power_consumption.txt"
                     ,sep = ";",header = TRUE
                     ,na.strings = "?")

HHpcon$Date = as.Date(HHpcon$Date,"%d/%m/%Y")

HHPC = filter(HHpcon,Date == "2007-02-01" | Date == "2007-02-02")

hist(HHPC$Global_active_power,col="Red"
     ,xlab="Global Active Power (kilowatts)"
     ,main = "Global Active Power"
)

dev.copy(png,file="plot1.png")
dev.off(4)