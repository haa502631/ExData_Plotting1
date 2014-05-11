data0 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
data1 <- subset(data0, data0$Date=="1/2/2007" | data0$Date=="2/2/2007")

data1$Global_active_power <- as.numeric(data1$Global_active_power)
data1$Sub_metering_1 <- as.numeric(data1$Sub_metering_1)
data1$Sub_metering_2 <- as.numeric(data1$Sub_metering_2)
data1$Sub_metering_3 <- as.numeric(data1$Sub_metering_3)
data1$Voltage <- as.numeric(data1$Voltage)
data1$Global_reactive_power <- as.numeric(data1$Global_reactive_power)

data2 <- transform(data1, DateTime=as.POSIXct(strptime(paste(data1$Date, data1$Time), "%d/%m/%Y %H:%M:%S")))

Sys.setlocale("LC_TIME","C")

par(mfcol=c(2, 2), mar=c(4,4.1,2,2.1))

plot(data2$DateTime, data2$Global_active_power, xlab="", ylab = "Global Active Power", type="l")

with(data2, plot(DateTime, Sub_metering_1, col="black", type="l", xlab="", ylab="Energy sub metering"))
with(data2, lines(DateTime, Sub_metering_2, col="red", type="l"))
with(data2, lines(DateTime, Sub_metering_3, col="blue", type="l"))
legend("topright", bty="n", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.6)

plot(data2$DateTime, data2$Voltage, xlab="datetime", ylab = "Voltage", type="l")

plot(data2$DateTime, data2$Global_reactive_power, xlab="datetime", ylab = "Global_reactive_power", type="l")

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
