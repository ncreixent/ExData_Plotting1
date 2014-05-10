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

plot(as.numeric(as.character(data$Global_active_power)), type ="l",ylab = "Global Active Power (kilowatts)",xlab = "",xaxt ="n")
axis(1, at = c(0,nrow(data)/2,nrow(data)),labels = c("Thu","Fri",'Sat'))

dev.copy(png, file = "plot2.png")
dev.off()

