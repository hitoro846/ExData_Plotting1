plot1<-function() {

#Read in data  
household_all <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Capture only data between 1/2/2007 and 2/2/2007, inclusive
household_subset <- household_all[household_all$Date %in% c("1/2/2007","2/2/2007") ,]

#Create png of histogram
power_data <- as.numeric(household_subset$Global_active_power)
png("plot1.png", width=480, height=480)
hist(power_data, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
}