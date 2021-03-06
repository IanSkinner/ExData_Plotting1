## This code reads the power concumption data set 
## and produced the viz for plot2 , outputting this to PNG


#Load data, convert date times and subset to 2 day period
plotdata <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings = "?")

plotdata$Date <- as.Date(plotdata$Date, format = "%d/%m/%Y")

plotdata <- subset(plotdata,Date >=as.Date("2007-02-01") & Date <=as.Date("2007-02-02"))
plotdata$Time <- as.POSIXct(strptime(paste(plotdata$Date,plotdata$Time), format = "%Y-%m-%d %H:%M:%S"))

#Open Graphics Device
windows()

#  line plot
plot(plotdata$Time,plotdata$Global_active_power, type = "l", xlab ="", ylab ="Global Active Power (Kilowatts)")

#Copy to PNG format at 480x480

dev.copy(png, filename = "plot2.png", width = 480, height = 480)
dev.off()