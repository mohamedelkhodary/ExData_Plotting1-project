
colnames <- colnames(read.table("household_power_consumption.txt", header = T, sep = ";", nrows = 0))

powerConsumption <- read.table(text = grep("^[1,2]/2/2007",readLines("household_power_consumption.txt"),value=T), header = T, sep = ";", na.strings = "?", col.names = colnames)

powerConsumption$dateTime <- strptime(paste(powerConsumption$Date, powerConsumption$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

###########################################################

png(filename = "plot1.png", width = 480, height = 480, units = "px")

hist(powerConsumption$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()







