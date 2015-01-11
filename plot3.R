#if you aleady have dataset "data1"(the total data) and "subdata"(data for two days)
#     after check plot1.R, and plot2.R, then please just ignore all the lines 
#     starting with "#". otherwise, please remove "#" for following commands. 

#data1 <- read.table(file = "./household_power_consumption.txt", header = T, sep = ";", 
#colClasses = c("character","character","numeric","numeric","numeric"
#               ,"numeric","numeric","numeric","numeric"), na.strings = "?")
#subdata <- subset(data1, Date == "1/2/2007" | Date == "2/2/2007")
#subdata$DateTime = as.POSIXct(strptime(paste(subdata$Date, subdata$Time), format="%d/%m/%Y %H:%M:%S"))

png(filename = "Plot3.png", width = 480, height = 480)
par(mar=c(3,5,2,2))
plot(subdata$DateTime,subdata$Sub_metering_1, type = 'n', ylab="Energy sub metering")
lines(subdata$DateTime, subdata$Sub_metering_1, col = "black")
lines(subdata$DateTime, subdata$Sub_metering_2, col = "red")
lines(subdata$DateTime, subdata$Sub_metering_3, col = "blue")
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black","red", "blue"),lty = c(1, 1, 1))
dev.off()
