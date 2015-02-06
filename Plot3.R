
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
png("Plot3.png", width=480, height = 480, units = "px", bg="white")

## Plot the Line Chart
## X Axis: Date/Time of the Observation
## Y Axis: Global Active Power Measurement

## Get the X Axis date-time values using the Date and Time Columns
xvals <- strptime(paste(chart.data$Date,chart.data$Time),"%Y-%m-%d %H:%M:%S")

## Plot Sub Metering 1 values
plot(xvals,chart.data$Sub_metering_1, type="l",xlab="",ylab="Energy sub metering")

## Add a line for the Sub Metering 2 values
lines(xvals,chart.data$Sub_metering_2,type="l",col="red")

## Add a line for the Sub Metering 3 values
lines(xvals,chart.data$Sub_metering_3,type="l",col="blue")

## Add the legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , lty = c(1,1,1), col= c("black", "red","blue"))


## Turn off the Graphics Device
dev.off()
