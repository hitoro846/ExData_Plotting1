plot2<-function() {
  
  #Read in data  
  household_all <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  
  #Capture only data between 1/2/2007 and 2/2/2007, inclusive
  household_subset <- household_all[household_all$Date %in% c("1/2/2007","2/2/2007") ,]
  
  #Pull data points
  power_data <- as.numeric(household_subset$Global_active_power)
  power_data_time <- strptime(paste(household_subset$Date, household_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  
  #Create png of plot of time versus power consumption
  png("plot2.png", width=480, height=480)
  plot(power_data_time, power_data, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.off()
}