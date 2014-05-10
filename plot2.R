household_power_consumption <- read.csv("household_power_consumption.txt", sep=";") #import dataset

## convert dates and times
household_power_consumption$Time <- strptime(paste(household_power_consumption$Date, household_power_consumption$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
household_power_consumption[, 1] <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")

## getting the subset
household_power_consumption <- household_power_consumption[format(household_power_consumption$Date, "%Y-%m-%d") == "2007-02-01" | format(household_power_consumption$Date, "%Y-%m-%d") == "2007-02-02" ,]

## plotting plot2.png
png(filename = "plot2.png")
plot(household_power_consumption$Time, household_power_consumption$Global_active_power, type = "l", xlab= "", ylab = "Global Active Power (kilowatts)")
dev.off()