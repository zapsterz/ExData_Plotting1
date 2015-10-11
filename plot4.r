filename = "household_power_consumption.txt"
df <- read.table(filename, header = TRUE, sep = ";", skip = 66636,nrows=2880, stringsAsFactors = FALSE, col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))

newdate <- as.Date(df$Date, "%d/%m/%Y")
timestamp <- (paste(newdate, df$Time))
act <- as.POSIXct(timestamp)

par(mfrow = c(2, 2))
par(cex = 0.35)

#make first plot
plot(act,df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#make second plot
plot(act,df$Voltage, type = "l", xlab = "", ylab = "Voltage")

#make third plot
plot(xrange, yrange, type="n", xlab="",
     ylab="Energu sub metering" )

par(pch=22, col="black")
lines(act, df$Sub_metering_1)
par(pch=22, col="red")
lines(act, df$Sub_metering_2)
par(pch=22, col="blue")
lines(act, df$Sub_metering_3)

#make fourth plot
plot(act,df$Global_reactive_power, type = "l", xlab = "", ylab = "Global Reactive Power (kilowatts)")

dev.copy(png,'plot4.png')
dev.off()
