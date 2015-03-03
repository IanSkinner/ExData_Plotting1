## This code reads the power concumption data set 
## and produced the viz for plot4 , outputting this to PNG


#Load data, convert date times and subset to 2 day period
plotdata <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings = "?")

plotdata$Date <- as.Date(plotdata$Date, format = "%d/%m/%Y")

plotdata <- subset(plotdata,Date >=as.Date("2007-02-01") & Date <=as.Date("2007-02-02"))
plotdata$Time <- as.POSIXct(strptime(paste(plotdata$Date,plotdata$Time), format = "%Y-%m-%d %H:%M:%S"))

#Open Graphics Device 
#Copy to PNG format at 480x480

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

    
#  line plot 1
with(plotdata, plot(Time, Global_active_power, type = "l", xlab ="", ylab ="Global Active Power") )

#  line plot 2

with(plotdata, plot(Time,Voltage, type = "l", xlab ="datetime") )   

#  line plot 3
with(plotdata ,plot(Time,Sub_metering_1, type = "l", xlab ="", ylab ="Energy sub Metering"))
with(plotdata ,points(Time,Sub_metering_2, type = "l", col="Red"))
with(plotdata ,points(Time,Sub_metering_3, type = "l", col="Blue"))
legend("topright", lty=c(1,1), col=c("Black","Blue","Red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")

#  line plot 4
with(plotdata, plot(Time,Global_reactive_power, type = "l", xlab ="datetime") )   

dev.off()