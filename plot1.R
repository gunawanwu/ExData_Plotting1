getwd()
setwd("C:/Git_Clarivate/_RStudio/ExData_Plotting1")

#calculate a rough estimate of how much memory required in GB for dataset with 2075259 rows and 9 columns
round(2075259*9*8/2^{20}/1024, 2) #0.14 GB RAM required

#read full data from household_power_consumption.txt
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#read subset data from the dates 2007-02-01 and 2007-02-02
data1 <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

#convert the Date and Time variables to Date/Time classes in R using as.Date() functions.
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

#construct plot1
hist(data1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
