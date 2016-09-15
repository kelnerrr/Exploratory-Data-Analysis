if(!(exists("mydata") && is.data.frame(get("mydata")))){
  EDA_data <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
  EDA_data$FullDate <- strptime(paste(EDA_data$Date, EDA_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  EDA_data$Global_active_power = as.numeric(EDA_data$Global_active_power)
  EDA_data$Global_reactive_power = as.numeric(EDA_data$Global_reactive_power)
  EDA_data$Voltage = as.numeric(EDA_data$Voltage)
  EDA_data$Global_intensity = as.numeric(EDA_data$Global_intensity)
  EDA_data$Sub_metering_1 = as.numeric(EDA_data$Sub_metering_1)
  EDA_data$Sub_metering_2 = as.numeric(EDA_data$Sub_metering_2)
  EDA_data$Sub_metering_3 = as.numeric(EDA_data$Sub_metering_3)
  
  mydata <- EDA_data[ which(EDA_data$FullDate >= strptime("01/02/2007", "%d/%m/%Y") & EDA_data$FullDate < strptime("03/02/2007", "%d/%m/%Y")), ]
}

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(mydata$FullDate, mydata$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(mydata$FullDate, mydata$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(mydata$FullDate, mydata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
lines(mydata$FullDate, mydata$Sub_metering_2, type="l", col="red")
lines(mydata$FullDate, mydata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

plot(mydata$FullDate, mydata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()