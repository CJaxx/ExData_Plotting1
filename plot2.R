# get the data into R
electricPC <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
# subset the data
electricPCsubset <- electricPC[electricPC$Date %in% c("1/2/2007", "2/2/2007") ,]

# Date & Time conversion
DtTm <- strptime(paste(electricPCsubset$Date, electricPCsubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#set up the graphic device and set output image dimensions
png("plot2.png", width=480, height=480)
#create the plot, ensuring that the field being plotted is set as numeric, plot 
#   type is "l" for line
plot(DtTm, as.numeric(electricPCsubset$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
# turn the graphic device off again
dev.off()