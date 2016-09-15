if(!(exists("mydata") && is.data.frame(get("mydata")))){
  EDA_data <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
  EDA_data$FullDate <- strptime(paste(EDA_data$Date, EDA_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  EDA_data$Global_active_power = as.numeric(EDA_data$Global_active_power)
  mydata <- EDA_data[ which(EDA_data$FullDate >= strptime("01/02/2007", "%d/%m/%Y") & EDA_data$FullDate < strptime("03/02/2007", "%d/%m/%Y")), ]
}

png("plot2.png", width=480, height=480)
plot(mydata$FullDate, mydata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()