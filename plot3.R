
colnames <- colnames(read.table("household_power_consumption.txt", header = T, sep = ";", nrows = 0))

powerConsumption <- read.table(text = grep("^[1,2]/2/2007",readLines("household_power_consumption.txt"),value=T), header = T, sep = ";", na.strings = "?", col.names = colnames)

powerConsumption$dateTime <- strptime(paste(powerConsumption$Date, powerConsumption$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

###########################################################

png(filename = "plot3.png", width = 480, height = 480, units = "px")

with(powerConsumption,
     {
       plot(dateTime,Sub_metering_1, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
       lines(dateTime,Sub_metering_2, col = "red")
       lines(dateTime,Sub_metering_3, col = "blue")
       legend("topright", col = c("black", "red", "blue"), lwd = c(1,1,1), c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))
     })

dev.off()