## required data ends at line number 69516
data <- read.table("household_power_consumption.txt", header=T, sep=";", nrows=69516, na.strings="?")
data <- subset(data, Date == "1/2/2007"|Date=="2/2/2007")
data <- transform(data, Date = as.Date(Date, format="%d/%m/%Y"), Time = strptime(Time, format="%H:%M:%S"), DateTime=strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"))

## plot2
png("plot2.png",width=400,height=400)
par(mfrow=c(1,1))
with(data,plot(Global_active_power~DateTime,type="l", ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()
