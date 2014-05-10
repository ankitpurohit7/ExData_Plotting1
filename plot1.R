household_power_consumption <- read.csv("household_power_consumption.txt", sep=";") #import dataset

startDate = format("2007-02-01", format="%d/%m/%Y" )  #set start date
endDate   = format("2007-02-02", format="%d/%m/%Y" )  #set end date

household_power_consumption[,1] = as.Date(household_power_consumption[,1], format="%d/%m/%Y")

household_power_consumption = subset(household_power_consumption, household_power_consumption$Date >= startDate & household_power_consumption$Date <= endDate)

png("plot1.png")      #make png of histogram
hist(as.numeric( household_power_consumption$Global_active_power)/1000, xlab="Global Active Power (kilowatts)", main = "Global Active Power", col="red")                                       
dev.off()