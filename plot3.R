#read full data from household_power_consumption.txt
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#read subset data from the dates 2007-02-01 and 2007-02-02
data1 <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

#convert the Date and Time variables to POSIXct datetime
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

#construct plot3
with(data1, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

