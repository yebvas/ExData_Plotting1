#Code to plot a histogram or Global Active Power for February 1-2, 2007

#read in the data
power_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

#change "Date" to Date class
power_data$Date <- as.Date(power_data$Date, format = "%d/%m/%Y")

#subset data for dates to be plotted
plot_data <- subset(power_data, Date >= "2007-02-01" & Date <= "2007-02-02")

#call graphic device png and size
png("plot1.png", width=480, height=480)

#plot histogram
hist(plot_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#close png graphics device
dev.off()