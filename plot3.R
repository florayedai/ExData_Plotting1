# plot3.R

if( !file.exists("./Data") ) { dir.create("./Data") }

if( !file.exists("exdata_data_household_power_consumption.zip")) {
      fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
      download.file(fileUrl, destfile="./exdata_data_household_power_consumption.zip")
}

Datafile <- unzip(zipfile="./exdata_data_household_power_consumption.zip", exdir = "./Data")

#plot 3
png(filename = "plot3.png", width = 480, height = 480, units = 'px')   
with(powerData, plot(as.POSIXct(paste(Date, Time)), Sub_metering_1, xlab = '', ylab = 'Energy sub metering',col='black', type = 'l'))
with(powerData, lines(as.POSIXct(paste(Date, Time)), Sub_metering_2, col='red'))
with(powerData, lines(as.POSIXct(paste(Date, Time)), Sub_metering_3, col='blue'))
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1 )
dev.off()