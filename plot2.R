# plot 1: histogram of Global Active Power for Feb 1-2, 2007

  # Read data in from file in current working directory:
  hpc <- read.delim("household_power_consumption.txt", sep=";", na.strings="?") 

  # subset of data for only 1-2-2007 (Feb 1, 2007) and 2-2-2007 (Feb 2, 2007)
  plot2Data <- subset(hpc, Date=='1/2/2007' | Date == '2/2/2007', select = c(Date, Time, Global_active_power))
    
    # set up PNG graphics device, specifying background color and output file
  png(file="plot2.png",bg="white")
  
  # Create plot of Global Active Power, specifying 
  # type = lines, no X-axis labels
  with(plot2Data, plot(Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)",xaxt="n"))
  # add X-axis labels, distributing tick marks across the span of Thursday (midnight Wednesday)
  # through Saturday (midnight Friday night)
  axis(1,c(0,1440,2880), c("Thu", "Fri", "Sat"))
  
  # close device
  dev.off()
