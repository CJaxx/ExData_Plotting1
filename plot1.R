# get the data into R
electricPC <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
# subset the data
electricPCsubset <- electricPC[electricPC$Date %in% c("1/2/2007", "2/2/2007") ,]
#set up the graphic device and set output image dimensions
png("plot1.png", width=480, height=480)
#create the histogram, ensuring that the field being plotted is set as numeric
hist(as.numeric(electricPCsubset$Global_active_power), col = "red", main= "Global Active Power", xlab = "Global Active Power (kilowatts)")
# turn the graphic device off again
dev.off()