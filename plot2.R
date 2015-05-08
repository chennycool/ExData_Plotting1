##read the data
ass1<- read.table("household_power_consumption.txt", header=TRUE, sep=";", na="?")
##choose only 2 days' data
ass1$Date<- as.Date(ass1$Date, "%d/%m/%Y")
ass1_2<- data.frame()
ass1_2<- ass1[ass1$Date == "2007-02-01" | ass1$Date == "2007-02-02",]
ass1_2$DT<- as.POSIXct(strptime (paste(ass1_2$Date, ass1_2$Time), "%Y-%m-%d %H:%M:%S"))

##plot2
png ("plot2.png", width=480, height=480)
plot (Global_active_power ~ DT, data=ass1_2,
	   type="l", 
	   xlab=NA, ylab="Global Active Power (kilowatts)"
	   )
dev.off() 
