library(data.table)

# Initialization of the processed data table
hpc_test=read.table("household_power_consumption.txt",nrows = 30 , header=TRUE, sep = ";")
hpc=read.table("household_power_consumption.txt",skip = 66637,nrows = 2880 , header=TRUE, sep = ";")
names(hpc)= names(hpc_test)
hpc$DateTime = strptime(paste(hpc$Date,hpc$Time), format = "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))
with(hpc,plot(DateTime,Global_active_power,type="l", ylab="Global Active Power", xlab=""))
plot(hpc$DateTime,hpc$Voltage,ylab = "Voltage", xlab="datetime", type="l")
plot(hpc$DateTime,hpc$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",col="black")
lines(hpc$DateTime,hpc$Sub_metering_2,type="l", col="red")
lines(hpc$DateTime,hpc$Sub_metering_3,type="l", col="blue")

#------------------ Having problems in legend. Dont know why. Im a MAC user!------------------------------#
#legend("topleft",c("Sub_metering_1","Sub_metering_2","Sub_metering_3", lty=1, col=c("black","red","blue")))

plot(hpc$DateTime,hpc$Global_reactive_power,type="l", xlab="datetime")

dev.print(png, "plot4.png", width=480, height=480)