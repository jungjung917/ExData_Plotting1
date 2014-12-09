#if you aleady have dataset "data1"(the total data) after check plot1.R,
#    then please just ignore or the lines starting with "#". 
#     otherwise, please remove "#" for following commands. 

#data1 <- read.table(file = "./household_power_consumption.txt", header = T, sep = ";", 
#colClasses = c("character","character","numeric","numeric","numeric"
#               ,"numeric","numeric","numeric","numeric"), na.strings = "?")

subdata <- subset(data1, Date == "1/2/2007" | Date == "2/2/2007")
subdata$DateTime = as.POSIXct(strptime(paste(subdata$Date, subdata$Time), format="%d/%m/%Y %H:%M:%S"))
head(subdata)

png(filename = "Plot2.png", width = 480, height = 480)
par(mar=c(3,5,2,2))
plot(subdata$DateTime, subdata$Global_active_power, type = 'n', ylab="Global Active Power (Kilowatts)")
lines(subdata$DateTime, subdata$Global_active_power)
dev.off()