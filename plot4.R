household_power_consumption <- read.csv("household_power_consumption.txt", sep=";") #import dataset

## convert dates and times
household_power_consumption$Time <- strptime(paste(household_power_consumption$Date, household_power_consumption$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
household_power_consumption[, 1] <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")

## getting the subset
household_power_consumption <- household_power_consumption[format(household_power_consumption$Date, "%Y-%m-%d") == "2007-02-01" | format(household_power_consumption$Date, "%Y-%m-%d") == "2007-02-02" ,]

## plotting plot4.png
png(filename = "plot4.png")
par(mfrow = c(2,2))
plot(household_power_consumption$Time, household_power_consumption$Global_active_power, type = "l", xlab= "", ylab = "Global Active Power")

plot(household_power_consumption$Time, household_power_consumption$Voltage, type = "l", xlab= "datetime", ylab = "Voltage")

plot(household_power_consumption$Time, household_power_consumption$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(household_power_consumption$Time, household_power_consumption$Sub_metering_2, type = "l", col = "red")
lines(household_power_consumption$Time, household_power_consumption$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd =1)

plot(household_power_consumption$Time, household_power_consumption$Global_reactive_power, type = "l", xlab= "datetime", ylab = "Global_reactive_power")
dev.off()