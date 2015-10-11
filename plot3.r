filename = "household_power_consumption.txt"
df <- read.table(filename, header = TRUE, sep = ";", skip = 66636,nrows=2880, stringsAsFactors = FALSE, col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))

newdate <- as.Date(df$Date, "%d/%m/%Y")
timestamp <- (paste(newdate, df$Time))
act <- as.POSIXct(timestamp)

par(mfrow = c(1,1))
par(cex = 0.8)

xrange <- range(act) 
yrange <- range(df$Sub_metering_1)
print(yrange)

plot(xrange, yrange, type="n", xlab="",
     ylab="Energu sub metering" )

par(pch=22, col="black")
lines(act, df$Sub_metering_1)
par(pch=22, col="red")
lines(act, df$Sub_metering_2)
par(pch=22, col="blue")
lines(act, df$Sub_metering_3)

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), lwd=c(2.5,2.5),col = c("black", "red", "blue"))

dev.copy(png,'plot3.png')
dev.off()
