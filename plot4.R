#For script to work, the dataset must be placed at your working directory.

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# We convert the Date column into Date Format

data$Date <- as.Date(data$Date,"%d/%m/%Y")

# We create a new column with Date/Time information

datetime <- strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S")
data <- cbind(datetime,data)

# We subset the information for the days under analysis

data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

# We create the plot

par(mfrow = c(2,2))

#plot 1

plot(as.numeric(as.character(data$Global_active_power)), type ="l",ylab = "Global Active Power",xlab = "",xaxt ="n")
axis(1, at = c(0,nrow(data)/2,nrow(data)),labels = c("Thu","Fri",'Sat'))

# plot 2
plot(as.numeric(as.character(data$Voltage)), type ="l",ylab = "Voltage",xlab = "datetime", xaxt ="n")
axis(1, at = c(0,nrow(data)/2,nrow(data)),labels = c("Thu","Fri",'Sat'))

# plot 3

plot(as.numeric(as.character(data$Sub_metering_1)), type ="l" , ylab = "Energy sub metering", xlab = "",xaxt ="n")
lines(as.numeric(as.character(data$Sub_metering_2)), col = "red")
lines(as.numeric(as.character(data$Sub_metering_3)), col = "blue")
axis(1, at = c(0,nrow(data)/2,nrow(data)),labels = c("Thu","Fri",'Sat'))
legend("topright",cex = 0.6, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n", lwd = 0, col = c("black","red","blue"))

# plot 4
plot(as.numeric(as.character(data$Global_reactive_power)), type ="l",ylab = "Global_reactive_power",xlab = "datetime",xaxt ="n")
axis(1,at = c(0,nrow(data)/2,nrow(data)),labels = c("Thu","Fri",'Sat'))
par(mfrow = c(1,1))

dev.copy(png, file = "plot4.png")
dev.off()