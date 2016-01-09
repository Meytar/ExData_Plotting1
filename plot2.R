# Read data file
householdData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?"))

# use only the lines needed for the assignment
HPC <- householdData[66637:69516,]

# Remove original BIG data file
rm(householdData)

# Combine Date and Time and convert to class date 
HPC$TimeNew <- paste(as.Date(HPC$Date, format="%d/%m/%Y"),HPC$Time, sep = " ")
HPC$TimeNew <- strptime(HPC$TimeNew, format="%Y-%m-%d %H:%M:%S")

# Open plot figure with label and y label 
plot(HPC$TimeNew, HPC$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
# Plot the graph
lines(HPC$TimeNew, HPC$Global_active_power)
# Copy and save as PNG
dev.copy(png, file = "plot2.png")
dev.off()