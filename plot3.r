plot3<-function() {
  
  #Read in data  
  household_all <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  
  #Capture only data between 1/2/2007 and 2/2/2007, inclusive
  household_subset <- household_all[household_all$Date %in% c("1/2/2007","2/2/2007") ,]
  
  #Pull data points
  power_data_time <- strptime(paste(household_subset$Date, household_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  subMetering1 <- as.numeric(household_subset$Sub_metering_1)
  subMetering2 <- as.numeric(household_subset$Sub_metering_2)
  subMetering3 <- as.numeric(household_subset$Sub_metering_3)
  
  #Create plot
  png("plot3.png", width=480, height=480)
  plot(power_data_time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
  lines(power_data_time, subMetering2, type="l", col="red")
  lines(power_data_time, subMetering3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
  dev.off()
}