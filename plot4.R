# plot 4: 4 plots using data for Feb 1-2, 2007

  # Read data in from file in current working directory:
  hpc <- read.delim("household_power_consumption.txt", sep=";", na.strings="?") 

  # subset of data for only 1-2-2007 (Feb 1, 2007) and 2-2-2007 (Feb 2, 2007)
  plot4Data <- subset(hpc, Date=='1/2/2007' | Date == '2/2/2007')
  
  # I'd use mutate from the dplyr package but it's not part of base, so this next line gets replaced :()
     # library(dplyr)
     # plot4Data <- mutate(plot4Data,Datetime=as.POSIXct(paste(plot4Data$Date, plot4Data$Time), format="%d/%m/%Y %H:%M:%S"))
   
  Datetime<-as.POSIXct(paste(plot4Data$Date, plot4Data$Time), format="%d/%m/%Y %H:%M:%S")
  names(Datetime) <- c("Datetime")
  plot4Data <- cbind(Datetime, plot4Data)

  # set up PNG graphics device, specifying background color and output file
  png(file="plot4.png",bg="white")
  par(mfrow=c(2,2), mar = c(4,4,4,2))
  
# Create 4 plots 
# On all, add X-axis labels, distributing tick marks across the span of Thursday (midnight Wednesday)
# through Saturday (midnight Friday night)
  
  # 1: Global Active Power
  with(plot4Data, {
       plot(Datetime, Global_active_power,type="l",xlab="", ylab="Global Active Power", 
            main="  ")
       axis(1,c(0,1440,2880), c("Thu", "Fri", "Sat"), main="  ")
 })
  
  # 2: Voltage
 with(plot4Data, {
    plot(Datetime, Voltage,type="l", xlab="datetime", ylab="Voltage", 
          main="    ")
     axis(1,c(0,1440,2880), c("Thu", "Fri", "Sat"), main="    ")
  })
  # 3: Energy sub-metering
  with(plot4Data, {
    plot(Sub_metering_1,type="l",xlab="", ylab="Energy sub metering", 
         xaxt="n", main = "   ")
    points(Sub_metering_2,type="l",xlab="",col="red", main="   ")
    points(Sub_metering_3,type="l",xlab="",col="blue", main="   ") 
    axis(1,c(0,1440,2880), c("Thu", "Fri", "Sat"), main = "   ")
    legend("topright",pch = " ", lwd=1, lty=1,merge=FALSE, bty="n", cex=0.75, col=c("black", "red", "blue"), 
           legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
  })
  
  # 4: Global Reactive Power
  with(plot4Data, {
    plot(Global_reactive_power,type="l",xlab="datetime", ylab="Global_reactive_power", xaxt="n", main=" ")
    axis(1,c(0,1440,2880), c("Thu", "Fri", "Sat"), main=" ")
    axis(2,c(0,0.1,0.2,0.3,0.4,0.5), c("0.0", "0.1", "0.2","0.3","0.4","0.5"), main=" er")
  })
  
  mtext("Plot 4", outer = TRUE)

  # close device
  dev.off()
