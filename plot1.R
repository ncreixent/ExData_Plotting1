#For script to work, the dataset must be placed at your working directory.

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# We convert the Date column into Date Format

data$Date <- as.Date(data$Date,"%d/%m/%Y")

# We create a new column with Date/Time information

datetime <- strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S")
data <- cbind(datetime,data)

# We subset the information for the days under analysis

data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

# We create the histogram as well as the png file

hist(as.numeric(as.character(data$Global_active_power)),main = "Global Active Power",xlab = "Global Active Power (kilowatts)", col = "red")
dev.copy(png, file = "plot1.png")
dev.off()

