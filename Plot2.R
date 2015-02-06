
## Read the Data (assumption: data file is in the working directory)
all.data<-read.table("household_power_consumption.txt",sep=";",as.is=TRUE,header=TRUE,na.strings="?")

## Convert to Date Type
all.data$Date<-as.Date(all.data$Date,"%d/%m/%Y")

## Set the Date Range for the Data
from.date=as.Date("2007-02-01","%Y-%m-%d")
to.date=as.Date("2007-02-02","%Y-%m-%d")

## Get the Data for the above Date Range
chart.data <- all.data[which(all.data$Date == from.date | all.data$Date == to.date ),]

## Create the Graphics Device
png("Plot2.png", width=480, height = 480, units = "px", bg="white")

## Plot the Line Chart
## X Axis: Date/Time of the Observation
## Y Axis: Global Active Power Measurement
plot(strptime(paste(chart.data$Date,chart.data$Time),"%Y-%m-%d %H:%M:%S"),chart.data$Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)")

## Turn off the Graphics Device
dev.off()

