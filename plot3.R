# get the data into R
electricPC <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                         stringsAsFactors = FALSE, dec=".")
# subset the data
electricPCsubset <- electricPC[electricPC$Date %in% c("1/2/2007", "2/2/2007") ,]

# Date & Time conversion
DtTm <- strptime(paste(electricPCsubset$Date, electricPCsubset$Time, sep=" "),   
                 "%d/%m/%Y %H:%M:%S")
# subMetering data needs to be numeric
sM1 <- as.numeric(electricPCsubset$Sub_metering_1)
sM2 <- as.numeric(electricPCsubset$Sub_metering_2)
sM3 <- as.numeric(electricPCsubset$Sub_metering_3)

#set up the graphic device and set output image dimensions
png("plot3.png", width=480, height=480)
# build up the plot, changing the colours for the three sub metering data sets
plot(DtTm, sM1, type="l", xlab= "", ylab="Energy submetering")
lines(DtTm, sM2, type = "l", col="red")
lines(DtTm, sM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = 1, 
       lwd =2, col=c("black", "red", "blue"))
dev.off()



