# Read data file
householdData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?"))

# use only the lines needed for the assignment
HPC <- householdData[66637:69516,]

# Remove original BIG data file
rm(householdData)


png(file = "plot4.png") ## Open PNG device, create "plot4.png" 

par(mfcol = c(2,2)) ## Define the number and structure of sub-plotting 

# Plot all 4 plots to the PNG file
with(HPC, {
  
  # Global Active Power
  plot(TimeNew, Global_active_power, type = "n",xlab = "", ylab = "Global Active Power")
  lines(TimeNew, Global_active_power)
  
  # Sub_metering 
  plot(TimeNew, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
  lines(TimeNew, Sub_metering_1, col = "black")
  lines(TimeNew, Sub_metering_2, col = "red")
  lines(TimeNew, Sub_metering_3, col = "blue")
  legend("topright", lty = 1 , col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")
  
  # Voltage
  plot(TimeNew, Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
  lines(TimeNew, Voltage, col = "black")
  
  # Global reactive power
  plot(TimeNew, Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power")
  lines(TimeNew, Global_reactive_power, col = "black")
})

dev.off() ## close device and save to PNG