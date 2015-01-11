data1 <- read.table(file = "./household_power_consumption.txt", header = T, sep = ";", 
colClasses = c("character","character","numeric","numeric","numeric"
               ,"numeric","numeric","numeric","numeric"), na.strings = "?")
subdata <- subset(data1, Date == "1/2/2007" | Date == "2/2/2007")
subdata$DateTime = as.POSIXct(strptime(paste(subdata$Date, subdata$Time), format="%d/%m/%Y %H:%M:%S"))

png(filename = "Plot4.png", width = 480, height = 480)
par(mfcol = c(2,2),mar=c(5,5,3,2))
plot(subdata$DateTime, subdata$Global_active_power, type = 'n', ylab="Global Active Power",xlab = "")
lines(subdata$DateTime, subdata$Global_active_power)

plot(subdata$DateTime,subdata$Sub_metering_1, type = 'n', ylab="Energy sub metering",xlab = "")
lines(subdata$DateTime, subdata$Sub_metering_1, col = "black")
lines(subdata$DateTime, subdata$Sub_metering_2, col = "red")
lines(subdata$DateTime, subdata$Sub_metering_3, col = "blue")
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black","red", "blue"),lty = c(1, 1, 1),bty = "n")

plot(subdata$DateTime,subdata$Voltage,type = 'n', ylab="Vltage", xlab = "datetime")
lines(subdata$DateTime,subdata$Voltage)

plot(subdata$DateTime,subdata$Global_reactive_power,type = 'n', ylab="Global_reactive_power", xlab = "datetime")
lines(subdata$DateTime,subdata$Global_reactive_power)

dev.off()
