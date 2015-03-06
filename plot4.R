
df <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE , na.strings = "?", stringsAsFactors=FALSE)

df$timestamp <- strptime ( paste(df$Date, df$Time) , "%d/%m/%Y %T")

sampDf <-  subset(df, timestamp >= as.POSIXct("2007-02-01") & timestamp < as.POSIXct("2007-02-03") )

png("plot4.png")

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 0, 0))
with(sampDf, {
        plot(y = Global_active_power,x = timestamp , type = "l" , xlab = "",ylab = "Global Active Power")
        plot(y = Voltage, x = timestamp , type = "l" , xlab = "daytime", ylab = "Voltage")        
        plot(sampDf$timestamp, sampDf$Sub_metering_1 , xlab = "" , ylab = "Energy Sub Metering", type = "l") 
                points(sampDf$timestamp, sampDf$Sub_metering_2, col="red" , type = "l")
                points(sampDf$timestamp, sampDf$Sub_metering_3, col="blue" , type = "l")
                legend("topright", col = c("black", "red" , "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.6, lty = 1 ,bty="n")
        
        plot(y = Global_reactive_power, x = timestamp , type = "l" , xlab = "daytime", ylab = "Global_reactive_power")                
})

dev.off()
