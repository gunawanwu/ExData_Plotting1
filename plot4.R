getwd()
setwd("C:/Git_Clarivate/_RStudio/ExData_Plotting1")

#calculate a rough estimate of how much memory required in GB for dataset with 2075259 rows and 9 columns
round(2075259*9*8/2^{20}/1024, 2) #0.14 GB RAM required

#read full data from household_power_consumption.txt
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#read subset data from the dates 2007-02-01 and 2007-02-02
data1 <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

#convert the Date and Time variables to POSIXct datetime
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

#construct plot4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data1, {
        plot(Global_active_power~Datetime, type="l", ylab="Global Active Power", xlab="")
        plot(Voltage~Datetime, type="l", ylab="Voltage", xlab="datetime")
        plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~Datetime,col='Red') 
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Datetime, type="l", 
             ylab="Global_rective_power",xlab="datetime")
})

#save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
