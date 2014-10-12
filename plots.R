hpc <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE)
hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time), format = "%d/%m/%Y %T")
hpc$Date <- as.Date(paste(hpc$Date,hpc$Time), format = "%d/%m/%Y")
hpc$Global_active_power   <- as.numeric(hpc$Global_active_power)
hpc$Global_reactive_power <- as.numeric(hpc$Global_reactive_power)
hpc$Voltage               <- as.numeric(hpc$Voltage)
hpc$Global_intensity      <- as.numeric(hpc$Global_intensity)
hpc$Sub_metering_1        <- as.numeric(hpc$Sub_metering_1)
hpc$Sub_metering_2        <- as.numeric(hpc$Sub_metering_2)
hpc$Sub_metering_3        <- as.numeric(hpc$Sub_metering_3)
hpc$Time <- NULL

## let's filter down the to two days in febuary we want:
hpc <- hpc[which(hpc$Date >= as.Date("2-1-2007","%m-%d-%Y") & hpc$Date <= as.Date("2-2-2007","%m-%d-%Y")),]

## Plot 1
png(filename = "figure/plot1.png",width = 480, height = 480)
hist(hpc$Global_active_power, xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power",col="Red")
dev.off()

## Plot 2
png(filename = "figure/plot2.png",width = 480, height = 480)
plot(hpc$DateTime, hpc$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off() 

## Plot 3
png(filename = "figure/plot3.png",width = 480, height = 480)
plot(hpc$DateTime, hpc$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(hpc$DateTime, hpc$Sub_metering_2,col="Red")
lines(hpc$DateTime, hpc$Sub_metering_3,col="Blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("Black","Red","Blue"),lwd=2)
dev.off()

##Plot 4
png(filename = "figure/plot4.png",width = 480, height = 480)
par(mfcol=c(2,2))
plot(hpc$DateTime, hpc$Global_active_power,type="l",ylab="Global Active Power",xlab="")

plot(hpc$DateTime, hpc$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(hpc$DateTime, hpc$Sub_metering_2,col="Red")
lines(hpc$DateTime, hpc$Sub_metering_3,col="Blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("Black","Red","Blue"),lwd=2)

plot(hpc$DateTime, hpc$Voltage,type="l",ylab="Voltage",xlab="datetime")

plot(hpc$DateTime, hpc$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off()
