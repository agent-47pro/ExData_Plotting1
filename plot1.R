# Step 1 - Read, name and subset the required power consumption data

power.data <- read.table("household_power_consumption.txt",header = TRUE, sep=";", stringsAsFactors = FALSE)
names(power.data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1",+
                         "Sub_metering_2","Sub_metering_3")
required.data <- subset(power.data, power.data$Date == "1/2/2007" | power.data$Date == "2/2/2007")

# Step 2 - Basic plotting

GlobalActivePower <- as.numeric(required.data$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(GlobalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")

# Step 3 - Annotating required elements

title(main = "Global Avtive Power")

#Step 4 - Closing the graphic device

dev.off()

#Step - 5: Please manually open the plot2.png file to see the plot. 

