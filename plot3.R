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

plot(as.numeric(as.character(data$Sub_metering_1)), type ="l" , ylab = "Energy sub metering", xlab = "",xaxt ="n")
lines(as.numeric(as.character(data$Sub_metering_2)), col = "red")
lines(as.numeric(as.character(data$Sub_metering_3)), col = "blue")
axis(1, at = c(0,nrow(data)/2,nrow(data)),labels = c("Thu","Fri",'Sat'))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd = 1, col = c("black","red","blue"))
dev.copy(png, file = "plot3.png")
dev.off()