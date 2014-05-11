data0 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
data1 <- subset(data0, data0$Date=="1/2/2007" | data0$Date=="2/2/2007")

data1$Sub_metering_1 <- as.numeric(data1$Sub_metering_1)
data1$Sub_metering_2 <- as.numeric(data1$Sub_metering_2)
data1$Sub_metering_3 <- as.numeric(data1$Sub_metering_3)

data2 <- transform(data1, DateTime=as.POSIXct(strptime(paste(data1$Date, data1$Time), "%d/%m/%Y %H:%M:%S")))

Sys.setlocale("LC_TIME","C")
with(data2, plot(DateTime, Sub_metering_1, col="black", type="l", ylab="Energy sub metering"))
with(data2, lines(DateTime, Sub_metering_2, col="red", type="l"))
with(data2, lines(DateTime, Sub_metering_3, col="blue", type="l"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
