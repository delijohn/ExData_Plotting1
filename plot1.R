setAs("character","DateConversion", function(from) as.Date(from, format="%d/%m/%Y") )
setAs("character","TimeConversion", function(from) strptime(from, format="%T") )

df <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE , na.strings = "?", stringsAsFactors=FALSE , colClasses=c("Date"="DateConversion","Time"="TimeConversion"))

sampDf <-  subset(df,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02") )

png("plot1.png")

hist(sampDf$Global_active_power , xlab = "Global Active Power (kilowatts)" , main = "Global Active Power" , col = "red")


 dev.off()