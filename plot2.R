#Code to plot Global Active Power for February 1-2, 2007

#read in the data
power_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

#change "Date" to Date class
power_data$Date <- as.Date(power_data$Date, format = "%d/%m/%Y")

#create a date time atribute
power_data$DateTime <- strptime(paste(power_data$Date, power_data$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")

#subset data for dates to be plotted
plot_data <- subset(power_data, Date >= "2007-02-01" & Date <= "2007-02-02")

#call graphic device png and size
png("plot2.png", width=480, height=480)

#plot Active Power
plot(plot_data$DateTime, plot_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#close png graphics device
dev.off()