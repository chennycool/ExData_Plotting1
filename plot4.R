##read the data
ass1<- read.table("household_power_consumption.txt", header=TRUE, sep=";", na="?")
##choose only 2 days' data
ass1$Date<- as.Date(ass1$Date, "%d/%m/%Y")
ass1_2<- data.frame()
ass1_2<- ass1[ass1$Date == "2007-02-01" | ass1$Date == "2007-02-02",]
ass1_2$DT<- as.POSIXct(strptime (paste(ass1_2$Date, ass1_2$Time), "%Y-%m-%d %H:%M:%S"))

##plot3
png ("plot4.png", width=480, height=480)
par(mfcol=c(2,2))

plot (Global_active_power ~ DT, data=ass1_2,
	   type="l", 
	   xlab=NA, ylab="Global Active Power (kilowatts)"
	   )

plot(Sub_metering_1 ~ DT, data=ass1_2, type="l", xlab=NA, ylab="Energy sub metering")
lines(Sub_metering_2 ~ DT, data=ass1_2,col="red")
lines(Sub_metering_3 ~ DT, data=ass1_2,col="blue")
legend.txt<- c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")
legend.col<- c("black","red","blue")
legend("topright", legend = legend.txt, col = legend.col, lty = 1, bty="n")

plot(Voltage ~ DT, data=ass1_2, type="l", xlab="datetime", ylab="Voltage")

plot(Global_reactive_power ~ DT, data=ass1_2, type="l", xlab="datetime")

dev.off() 
