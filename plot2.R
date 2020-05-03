# Step 1 - Read, name and subset the required power consumption data

power.data <- read.table("household_power_consumption.txt",header = TRUE, sep=";", stringsAsFactors = FALSE)
names(power.data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
required.data <- subset(power.data, power.data$Date=="1/2/2007" | power.data$Date=="2/2/2007")

# Step 2 - Transforming characters date and time in data into R objects of class Date and POSIXlt

R_Date_Time <- strptime(paste(required.data$Date, required.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Step 3 - Basic plotting

GlobalActivePower <- as.numeric(required.data$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(R_Date_Time, GlobalActivePower,type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Step 4 - Annotations: Title not added because not mentioned in the question explicitly.

# Step 5 - Closing the graphic device

dev.off()

#Step - 6: Please manually open the plot2.png file to see the plot. 
