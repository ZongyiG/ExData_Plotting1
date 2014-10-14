plot4 <- function()
{
	#read data into R
	hpc <- read.csv("./household_power_consumption.txt", header =TRUE, sep =";",na.strings ="?")
	
	#subset dataframe
	hpc_subset <- subset(hpc, Date == "1/2/2007"| Date == "2/2/2007")
	
	#merge Date and Time column
	Date_Time <- paste(hpc_subset$Date, hpc_subset$Time)
	
	#convert Date_Time from 'character' to 'time' class
	x <- strptime(Date_Time, "%d/%m/%Y %H:%M:%S")	#plot data on screen
	
	#plot data on screen
	par(mfrow=c(2,2))
	par(bg = "white")
	
	plot(x,hpc_subset$Global_active_power,"l", xlab ="", ylab = "Global Active Power")
	plot(x,hpc_subset$Voltage, "l", xlab ="datetime", ylab = "Voltage")
	
	plot(x, hpc_subset$Sub_metering_1, "l", xlab = "", ylab = "Energy sub metering")
	lines(x, hpc_subset$Sub_metering_2, col = "red")
	lines(x, hpc_subset$Sub_metering_3, col = "blue")	
	legend('topright', c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=1, col=c('black', 'red', 'blue'), bty='n')
	
	plot(x, hpc_subset$Global_reactive_power, "l", xlab ="datetime", ylab = "Global_reactive_power")
	
	#save as png file
	dev.copy(png, file = "plot4.png")
	dev.off()		
}