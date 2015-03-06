df <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE , na.strings = "?", stringsAsFactors=FALSE)

df$timestamp <- strptime ( paste(df$Date, df$Time) , "%d/%m/%Y %T")

sampDf <-  subset(df, timestamp >= as.POSIXct("2007-02-01") & timestamp < as.POSIXct("2007-02-03") )

png("plot3.png")

plot(y = sampDf$Global_active_power,x = sampDf$timestamp , type = "l" , xlab = "",ylab = "Global Active Power (kilowatts)")

with(sampDf, plot(sampDf$timestamp, sampDf$Sub_metering_1 , xlab = "" , ylab = "Energy Sub Metering", type = "l") )
points(sampDf$timestamp, sampDf$Sub_metering_2, col="red" , type = "l")
points(sampDf$timestamp, sampDf$Sub_metering_3, col="blue" , type = "l")
legend("topright", col = c("black", "red" , "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.7, lty = 1 )


dev.off()