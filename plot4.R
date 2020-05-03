# Step 1 - Read, name and subset the required power consumption data

power.data <- read.table("household_power_consumption.txt",header = TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
names(power.data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
required.data <- subset(power.data, power.data$Date=="1/2/2007" | power.data$Date=="2/2/2007")

# Step 2 - Transforming characters date and time in data into R objects of class Date and POSIXlt

R_Date_Time <- strptime(paste(required.data$Date, required.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Step 3 - Setting the number of rows and columns in display

png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

# Step 4 - Plotting the 4 graphs

GlobalActivePower <- as.numeric(required.data$Global_active_power)
GlobalReactivePower <- as.numeric(required.data$Global_reactive_power)
SubMetering1 <- as.numeric(required.data$Sub_metering_1)
SubMetering2 <- as.numeric(required.data$Sub_metering_2)
SubMetering3 <- as.numeric(required.data$Sub_metering_3)
Voltage <- as.numeric(required.data$Voltage)
plot(R_Date_Time, GlobalActivePower, type="l", ylab="Global Active Power", xlab="", cex=0.2)
plot(R_Date_Time, GlobalReactivePower, type="l", ylab="Global Reactive Power", xlab="", cex=0.2)
plot(R_Date_Time, Voltage, type="l", ylab="Voltage", xlab="datetime")
plot(R_Date_Time, SubMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(R_Date_Time, SubMetering2, type="l", col="red")
lines(R_Date_Time, SubMetering3, type="l", col="blue")

# Step 5 - Annotations: Adding legend.

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black","red","blue"))

# Step 6 - Closing the graphic device

dev.off()

