##read the data
ass1<- read.table("household_power_consumption.txt", header=TRUE, sep=";", na="?")
##choose only 2 days' data
ass1$Date<- as.Date(ass1$Date, "%d/%m/%Y")
ass1_2<- data.frame()
ass1_2<- ass1[ass1$Date == "2007-02-01" | ass1$Date == "2007-02-02",]


##plot1
png ("plot1.png", width=480, height=480)
hist (ass1_2$Global_active_power, 
	   main="Global Active Power", 
	   xlab="Global Active Power (kilowatts)", 
	   col="red", breaks=20)
dev.off() 
