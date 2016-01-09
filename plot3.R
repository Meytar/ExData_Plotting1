# Read data file
householdData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?"))

# use only the lines needed for the assignment
HPC <- householdData[66637:69516,]

# Remove original BIG data file
rm(householdData)

png(file = "plot3.png") ## Open PNG device, create "plot3.png" 
## Create plot and send to the file
plot(HPC$TimeNew, HPC$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(HPC$TimeNew, HPC$Sub_metering_1, col = "black")
lines(HPC$TimeNew, HPC$Sub_metering_2, col = "red")
lines(HPC$TimeNew, HPC$Sub_metering_3, col = "blue")
legend("topright", lty = 1 , col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off() ## Close PNG device