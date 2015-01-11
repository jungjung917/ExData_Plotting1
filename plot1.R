data1 <- read.table(file = "./household_power_consumption.txt", header = T, sep = ";", 
                    colClasses = c("character","character","numeric","numeric","numeric"
                                   ,"numeric","numeric","numeric","numeric"), na.strings = "?")

subdata <- subset(data1, Date == "1/2/2007" | Date == "2/2/2007")
png(filename = "plot1.png", width = 480, height = 480)
par(mar=c(5,5,2,2))
hist(subdata$Global_active_power,col="red",xlab="Global Active Power (Kilowatts)",main = "Global Active Power")
dev.off()
