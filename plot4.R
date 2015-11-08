# get the data into R
electricPC <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
# subset the data
electricPCsubset <- electricPC[electricPC$Date %in% c("1/2/2007", "2/2/2007") ,]

#Convert the date and time
DtTm <- strptime(paste(electricPCsubset$Date, electricPCsubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")



#set up the graphic device and set output image dimensions, including 4 plots
png("plot4.png", width=480, height=480)
par(mfcol = c(2, 2))

#plot 1 (the same as plot2.R)
plot(DtTm, as.numeric(electricPCsubset$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")

# plot 2 (the same as plot3.R)
plot(DtTm, as.numeric(electricPCsubset$Sub_metering_1), type="l", xlab= "", ylab="Energy sub metering")
lines(DtTm, as.numeric(electricPCsubset$Sub_metering_2), type = "l", col="red")
lines(DtTm, as.numeric(electricPCsubset$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = 1, lwd =2, col=c("black", "red", "blue"))

# plot 3
plot(DtTm, as.numeric(electricPCsubset$Voltage), type="l", xlab = "datetime", ylab = "Voltage")

# plot 4
plot(DtTm, as.numeric(electricPCsubset$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()