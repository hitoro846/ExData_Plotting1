plot4<-function() {
  #Read in data  
  household_all <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  
  #Capture only data between 1/2/2007 and 2/2/2007, inclusive
  household_subset <- household_all[household_all$Date %in% c("1/2/2007","2/2/2007") ,]
  
  #Pull data points
  time <- strptime(paste(household_subset$Date, household_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  active <- as.numeric(household_subset$Global_active_power)
  reactive <- as.numeric(household_subset$Global_reactive_power)
  subMetering1 <- as.numeric(household_subset$Sub_metering_1)
  subMetering2 <- as.numeric(household_subset$Sub_metering_2)
  subMetering3 <- as.numeric(household_subset$Sub_metering_3)
  voltage <- as.numeric(household_subset$Voltage)
  
  #Create plot
  png("plot4.png", width=480, height=480)
  par(mfrow = c(2, 2))
  plot(time, active, type="l", xlab="", ylab="Global Active Power", cex=0.2)
  plot(time, voltage, type="l", xlab="datetime", ylab="Voltage")
  plot(time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
  lines(time, subMetering2, type="l", col="red")
  lines(time, subMetering3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
  plot(time, reactive, type="l", xlab="datetime", ylab="Global_reactive_power")
  dev.off()
}