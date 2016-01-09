# Read data file
householdData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?"))

# use only the lines needed for the assignment
HPC <- householdData[66637:69516,]

# Remove original BIG data file
rm(householdData)

# Plot histogram with title, x label and color
hist(HPC$Global_active_power,main = "Global Activite Power", xlab = "Global Active Power (kilowatts)", col = "red")

# Copy to PNG and save file
dev.copy(png, file = "plot1.png")
dev.off()