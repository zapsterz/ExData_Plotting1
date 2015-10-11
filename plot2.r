filename = "household_power_consumption.txt"
df <- read.table(filename, header = TRUE, sep = ";", skip = 66636,nrows=2880, stringsAsFactors = FALSE, col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))

newdate <- as.Date(df$Date, "%d/%m/%Y")
timestamp <- (paste(newdate, df$Time))
act <- as.POSIXct(timestamp)

plot(act,df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

par(mfrow = c(1,1))
par(cex = 0.8)

dev.copy(png,'plot2.png')
dev.off()
