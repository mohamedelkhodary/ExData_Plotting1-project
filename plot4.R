
colnames <- colnames(read.table("household_power_consumption.txt", header = T, sep = ";", nrows = 0))

powerConsumption <- read.table(text = grep("^[1,2]/2/2007",readLines("household_power_consumption.txt"),value=T), header = T, sep = ";", na.strings = "?", col.names = colnames)

powerConsumption$dateTime <- strptime(paste(powerConsumption$Date, powerConsumption$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

###########################################################

png(filename = "plot4.png", width = 480, height = 480, units = "px")

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(powerConsumption,
     {
       plot(dateTime,Global_active_power, type="l", 
            ylab="Global Active Power", xlab="")
       plot(dateTime,Voltage, type="l", 
            ylab="Voltage", xlab="dateTime")
       plot(dateTime,Sub_metering_1, type="l", 
            ylab="Energy Sub Metering", xlab="")
       lines(dateTime,Sub_metering_2,col='Red')
       lines(dateTime,Sub_metering_3,col='Blue')
       legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
              legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
       plot(dateTime,Global_reactive_power, type="l", 
            ylab="Global Reactive Power",xlab="dateTime")
     })

dev.off()







