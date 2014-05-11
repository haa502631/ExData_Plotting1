data0 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
data1 <- subset(data0, data0$Date=="1/2/2007" | data0$Date=="2/2/2007")

data1$Global_active_power <- as.numeric(data1$Global_active_power)

hist(data1$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
