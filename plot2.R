# plot2.R

if( !file.exists("./Data") ) { dir.create("./Data") }

if( !file.exists("exdata_data_household_power_consumption.zip")) {
      fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
      download.file(fileUrl, destfile="./exdata_data_household_power_consumption.zip")
}

Datafile <- unzip(zipfile="./exdata_data_household_power_consumption.zip", exdir = "./Data")

#plot 2
png(filename = "plot2.png", width = 480, height = 480, units = 'px')   
powerData$Date <- as.Date(powerData$Date, format="%d/%m/%Y")
with(powerData, plot(as.POSIXct(paste(Date, Time)), Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)',col='black', type = 'l'))
dev.off()
