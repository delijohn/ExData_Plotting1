
df <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE , na.strings = "?", stringsAsFactors=FALSE)

df$timestamp <- strptime ( paste(df$Date, df$Time) , "%d/%m/%Y %T")

sampDf <-  subset(df, timestamp >= as.POSIXct("2007-02-01") & timestamp < as.POSIXct("2007-02-03") )

png("plot2.png")
plot(y = sampDf$Global_active_power,x = sampDf$timestamp , type = "l" , xlab = "",ylab = "Global Active Power (kilowatts)")
dev.off()