plot3 <- function()
{
	#read data into R
	hpc <- read.csv("./household_power_consumption.txt", header =TRUE, sep =";",na.strings ="?")
	
	#subset dataframe
	hpc_subset <- subset(hpc, Date == "1/2/2007"| Date == "2/2/2007")
	
	#merge Date and Time column
	Date_Time <- paste(hpc_subset$Date, hpc_subset$Time)
	
	#convert Date_Time from 'character' to 'time' class
	x <- strptime(Date_Time, "%d/%m/%Y %H:%M:%S")
	
	#plot data
	par(bg = "white")
	plot(x, hpc_subset$Sub_metering_1, "l", xlab = "", ylab = "Energy sub metering")
	lines(x, hpc_subset$Sub_metering_2, col = "red")
	lines(x, hpc_subset$Sub_metering_3, col = "blue")
	
	legend('topright', c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=1, col=c('black', 'red', 'blue'))
	
	#save as png file
	dev.copy(png, file = "plot3.png")
	dev.off()
}