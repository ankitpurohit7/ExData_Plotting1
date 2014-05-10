# importing dataset
household_power_consumption <- read.table("household_power_consumption.txt", stringsAsFactors= F, header = T, sep=";", na.strings = "?") #import dataset

# convert dates and times
household_power_consumption$Time <- strptime(paste(household_power_consumption$Date, household_power_consumption$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
household_power_consumption[, 1] <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")

# getting the subset
startDate <- "2007-02-01" 
endDate <- "2007-02-02"
household_power_consumption <- household_power_consumption[format(household_power_consumption$Date, "%Y-%m-%d") == startDate | format(household_power_consumption$Date, "%Y-%m-%d") == endDate ,]

# plotting plot3.png
png(filename = "plot3.png")
plot(household_power_consumption$Time, household_power_consumption$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(household_power_consumption$Time, household_power_consumption$Sub_metering_2, type = "l", col = "red")
lines(household_power_consumption$Time, household_power_consumption$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd =1)  #add legend
dev.off()