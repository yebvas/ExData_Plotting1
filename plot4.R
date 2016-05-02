#Code to plot a histogram or Global Active Power for February 1-2, 2007

#read in the data
power_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

#change "Date" to Date class
power_data$Date <- as.Date(power_data$Date, format = "%d/%m/%Y")

#create a date time atribute
power_data$DateTime <- strptime(paste(power_data$Date, power_data$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")

#subset data for dates to be plotted
plot_data <- subset(power_data, Date >= "2007-02-01" & Date <= "2007-02-02")

#call graphic device png and size
png("plot4.png", width=480, height=480)

#set parameters for a 2 x 2 series of plots
par(mfcol = c(2, 2))

#plot Active Power
plot(plot_data$DateTime, plot_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#plot Sub metering
plot(plot_data$DateTime, plot_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(plot_data$DateTime, plot_data$Sub_metering_2, type = "l", col = "red")
points(plot_data$DateTime, plot_data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot voltage
plot(plot_data$DateTime, plot_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#plot reactive power
plot(plot_data$DateTime, plot_data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

#close png graphics device
dev.off()