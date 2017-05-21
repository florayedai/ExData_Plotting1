# plot1.R

if( !file.exists("./Data") ) { dir.create("./Data") }

if( !file.exists("exdata_data_household_power_consumption.zip")) {
      fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
      download.file(fileUrl, destfile="./exdata_data_household_power_consumption.zip")
}

Datafile <- unzip(zipfile="./exdata_data_household_power_consumption.zip", exdir = "./Data")

# read data from the dates 2007-02-01 and 2007-02-02
powerData <- read.table(text = grep("^[1,2]/2/2007", readLines(Datafile),value=TRUE), header = T, sep = ';', na.strings = '?') 

#set colunm names for the data
colnames(powerData ) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity",
                          "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")


# Plot 1
png(filename = "plot1.png", width = 480, height = 480, units = 'px')        
with(powerData, hist(Global_active_power, xlab = 'Global Active Power (kilowatt)', main = 'Global Active Power', col='red'))
dev.off()