
mainTab <- read.table("household_power_consumption.txt", sep = ";", dec=".", stringsAsFactors=FALSE, header = TRUE, na.strings = "?")

#subsetting main table for the required two dates
subsetTab <- mainTab[mainTab$Date %in% c("1/2/2007","2/2/2007") ,]

as.Date(subsetTab$Date)             # changing date vector to appropriate convention

subsetTab <- na.omit(subsetTab)
# changing time vector to appropriate convention
datetime <- strptime(paste(subsetTab$Date, subsetTab$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot3.png", width=480, height=480)
plot(datetime, subsetTab$Sub_metering_1, type = "l", col="black",
     xlab = "", ylab = "Energy sub metering")
lines(datetime, subsetTab$Sub_metering_2, type = "l", col="red")
lines(datetime, subsetTab$Sub_metering_3, type = "l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=2.5, col = c("black", "red", "blue"))
dev.off()
