# importing dataset
household_power_consumption <- read.table("household_power_consumption.txt", stringsAsFactors= F, header = T, sep=";", na.strings = "?") #import dataset

# convert dates and times
household_power_consumption$Time <- strptime(paste(household_power_consumption$Date, household_power_consumption$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
household_power_consumption[, 1] <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")

# getting the subset
startDate <- "2007-02-01" 
endDate <- "2007-02-02"
household_power_consumption <- household_power_consumption[format(household_power_consumption$Date, "%Y-%m-%d") == startDate | format(household_power_consumption$Date, "%Y-%m-%d") == endDate ,]

png(filename = "plot1.png")      #make png of histogram
hist(household_power_consumption$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main ="Global Active Power")                                      
dev.off()