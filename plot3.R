# plot 1: histogram of Global Active Power for Feb 1-2, 2007

  # Read data in from file in current working directory:
  hpc <- read.delim("household_power_consumption.txt", sep=";", na.strings="?") 

  # subset of data for only 1-2-2007 (Feb 1, 2007) and 2-2-2007 (Feb 2, 2007)
  plot3Data <- subset(hpc, Date=='1/2/2007' | Date == '2/2/2007')
    
  # set up PNG graphics device, specifying background color and output file
  png(file="plot3.png",bg="white")
  
  # Create plot of 3 sub metering metrics, specifying 
  # type = lines, no X-axis labels   xaxt="n'
  with(plot3Data, plot(Sub_metering_1,type="l",xlab="", ylab="Energy sub metering",xaxt="n"))
  with(plot3Data, points(Sub_metering_2,type="l",xlab="",col="red"))
  with(plot3Data, points(Sub_metering_3,type="l",xlab="",col="blue"))
  
  # add X-axis labels, distributing tick marks across the span of Thursday (midnight Wednesday)
  # through Saturday (midnight Friday night)
  axis(1,c(0,1440,2880), c("Thu", "Fri", "Sat"))
  legend("topright",pch = " ", lwd=1, lty=1,merge=FALSE, col=c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
  
  # close device
  dev.off()
