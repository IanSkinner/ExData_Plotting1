## This code reads the power concumption data set 
## and produced the viz for plot3 , outputting this to PNG


#Load data, convert date times and subset to 2 day period
plotdata <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings = "?")

plotdata$Date <- as.Date(plotdata$Date, format = "%d/%m/%Y")

plotdata <- subset(plotdata,Date >=as.Date("2007-02-01") & Date <=as.Date("2007-02-02"))
plotdata$Time <- as.POSIXct(strptime(paste(plotdata$Date,plotdata$Time), format = "%Y-%m-%d %H:%M:%S"))

#Open Graphics Device 
#Copy to PNG format at 480x480

png(filename = "plot3.png", width = 480, height = 480)

#  line plot
with(plotdata ,plot(Time,Sub_metering_1, type = "l", xlab ="", ylab ="Energy sub Metering"))
with(plotdata ,points(Time,Sub_metering_2, type = "l", col="Red"))
with(plotdata ,points(Time,Sub_metering_3, type = "l", col="Blue"))
legend("topright", lty=c(1,1), col=c("Black","Blue","Red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


dev.off()