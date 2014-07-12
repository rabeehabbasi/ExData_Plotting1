## required data ends at line number 69516
data <- read.table("household_power_consumption.txt", header=T, sep=";", nrows=69516, na.strings="?")
data <- subset(data, Date == "1/2/2007"|Date=="2/2/2007")
data <- transform(data, Date = as.Date(Date, format="%d/%m/%Y"), Time = strptime(Time, format="%H:%M:%S"), DateTime=strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"))

## plot4
png("plot4.png",width=400,height=400)
par(mfrow=c(2,2))

with(data,plot(Global_active_power~DateTime,type="l", ylab="Global Active Power",xlab=""))

with(data,plot(Voltage~DateTime,type="l", ylab="Voltage"))

with(data,plot(Sub_metering_1~DateTime,type="l", ylab="Energy sub metering",xlab="",col="black"))
with(data,lines(Sub_metering_2~DateTime,type="l",xlab="",col="red"))
with(data,lines(Sub_metering_3~DateTime,type="l",xlab="",col="blue"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"), cex=.8, bty="n")

with(data,plot(Global_reactive_power~DateTime,type="l"))
dev.off()
