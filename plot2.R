data0 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
data1 <- subset(data0, data0$Date=="1/2/2007" | data0$Date=="2/2/2007")

data1$Global_active_power <- as.numeric(data1$Global_active_power)

data2 <- transform(data1, DateTime=as.POSIXct(strptime(paste(data1$Date, data1$Time), "%d/%m/%Y %H:%M:%S")))

Sys.setlocale("LC_TIME","C")
plot(data2$DateTime, data2$Global_active_power, xlab="", ylab = "Global Active Power (kilowatts)", type="l")

dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
