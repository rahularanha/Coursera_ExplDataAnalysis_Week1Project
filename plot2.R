
mainTab <- read.table("household_power_consumption.txt", sep = ";", dec=".", stringsAsFactors=FALSE, header = TRUE, na.strings = "?")

#subsetting main table for the required two dates
subsetTab <- mainTab[mainTab$Date %in% c("1/2/2007","2/2/2007") ,]

as.Date(subsetTab$Date)             # changing date vector to appropriate convention

subsetTab <- na.omit(subsetTab)
# changing time vector to appropriate convention
datetime <- strptime(paste(subsetTab$Date, subsetTab$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width=480, height=480)
plot(datetime, subsetTab$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
