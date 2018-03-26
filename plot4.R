#Read the file. Convert to data frame with proper column names. subset dataframe 1/2/2007 & 2/2/2007
power_usage <- read.table(text = grep("^[1,2]/2/2007",readLines("household_power_consumption.txt"),value=TRUE), sep = ";" , skip = 1 ,  na.strings = '?')
cnames <- readLines("household_power_consumption.txt",1)
cnames <- strsplit(cnames,";",fixed = TRUE )
colnames(power_usage) <- make.names(cnames[[1]])


dateTime <- strptime(paste(power_usage$Date, power_usage$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


#PLOT4
png(filename = "plot4.png", width = 480, height = 480, units='px')

par(mfrow = c(2, 2))

plot(dateTime, power_usage$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")

plot(dateTime, power_usage$Voltage, type = "l", xlab="dateTime", ylab="Voltage")

plot(dateTime, power_usage$Sub_metering_1, type = "l", xlab="", ylab="Energy Submetering")
lines(dateTime, power_usage$Sub_metering_2, col = "red")
lines(dateTime, power_usage$Sub_metering_3, col = "blue")
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)

plot(dateTime, power_usage$Global_reactive_power, type = "l", xlab="dateTime", ylab="Global_reactive_power")

dev.off()