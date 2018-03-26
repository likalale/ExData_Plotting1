#Read the file. Convert to data frame with proper column names. subset dataframe 1/2/2007 & 2/2/2007
power_usage <- read.table(text = grep("^[1,2]/2/2007",readLines("household_power_consumption.txt"),value=TRUE), sep = ";" , skip = 1 ,  na.strings = '?')
cnames <- readLines("household_power_consumption.txt",1)
cnames <- strsplit(cnames,";",fixed = TRUE )
colnames(power_usage) <- make.names(cnames[[1]])

#PLOT1
png(filename = "plot1.png", width = 480, height = 480, units='px')
hist(power_usage$Global_active_power, col = "red" , xlab = "Global Active Power(kilowatts)", ylab = "Frequency" ,main = "Global Active Power")
dev.off()