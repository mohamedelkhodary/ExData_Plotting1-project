
colnames <- colnames(read.table("household_power_consumption.txt", header = T, sep = ";", nrows = 0))

powerConsumption <- read.table(text = grep("^[1,2]/2/2007",readLines("household_power_consumption.txt"),value=T), header = T, sep = ";", na.strings = "?", col.names = colnames)

powerConsumption$dateTime <- strptime(paste(powerConsumption$Date, powerConsumption$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

###########################################################

png(filename = "plot2.png", width = 480, height = 480, units = "px")

plot(powerConsumption$dateTime, powerConsumption$Global_active_power, xlab = '', ylab = "Global Active Power (kilowatt)", type = "l")

dev.off()


