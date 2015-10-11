filename = "household_power_consumption.txt"
df <- read.table(filename, header = TRUE, sep = ";", skip = 66636,nrows=2880, stringsAsFactors = FALSE, col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
hist(df$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

par(mfrow = c(1,1))
par(cex = 0.8)

dev.copy(png,'plot1.png')
dev.off()
