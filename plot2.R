plot2 <- function()
{
	#read data into R
	hpc <- read.csv("./household_power_consumption.txt", header =TRUE, sep =";",na.strings ="?")
	
	#subset dataframe
	hpc_subset <- subset(hpc, Date == "1/2/2007"| Date == "2/2/2007")
	
	#merge Date and Time column
	Date_Time <- paste(hpc_subset$Date, hpc_subset$Time)
	
	#convert Date_Time from 'character' to 'time' class
	x <- strptime(Date_Time, "%d/%m/%Y %H:%M:%S")
			
	y <- hpc_subset$Global_active_power
	
    #plot y vs.x as line
    par(bg = "white")
    plot(x,y,"l", xlab ="", ylab = "Global Active Power (kilowatts)")
    
    #save as png file
	dev.copy(png, file = "plot2.png")
	dev.off()
}

