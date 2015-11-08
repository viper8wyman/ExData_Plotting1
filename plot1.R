# plot 1: histogram of Global Active Power for Feb 1-2, 2007

  # Read data in from file in current working directory:
  hpc <- read.delim("household_power_consumption.txt", sep=";", na.strings="?") 

  # subset of data for only 1-2-2007 (Feb 1, 2007) and 2-2-2007 (Feb 2, 2007)
  plot1Data <- subset(hpc, Date=='1/2/2007' | Date == '2/2/2007')
  
  # set up PNG graphics device, specifying background color and output file
  png(file="plot1.png",bg="white")
  
  # Create histogram of Global Active Power, specifying 
  # column color, title, X-axis label
  hist(plot1Data$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)", col="red")
  
  # close device
  dev.off()
