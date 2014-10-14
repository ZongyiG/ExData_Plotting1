plot1 <- function()
{
	#read data into R
	hpc <- read.csv("./household_power_consumption.txt", header =TRUE, sep =";",na.strings ="?")
	
	#subset dataframe
	hpc_subset <- subset(hpc, Date == "1/2/2007"| Date == "2/2/2007")
	
	#plot histogram on screen
	par(bg = "white")
	hist(hpc_subset$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
	
	#save histogram as png file
	dev.copy(png, file = "plot1.png")
	dev.off()
}
