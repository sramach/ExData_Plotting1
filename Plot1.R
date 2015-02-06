
## Read the Data (assumption: data file is in the working directory)
all.data<-read.table("household_power_consumption.txt",sep=";",as.is=TRUE,header=TRUE,na.strings="?")

## Convert to Date Type
all.data$Date<-as.Date(all.data$Date,"%d/%m/%Y")

## Set the Date Range for the Data
from.date=as.Date("2007-02-01","%Y-%m-%d")
to.date=as.Date("2007-02-02","%Y-%m-%d")

## Get the Data for the above Date Range
chart.data <- all.data[which(all.data$Date == from.date | all.data$Date == to.date ),]

## Create the Histogram
hist.info <- hist(chart.data$Global_active_power)

## Create the Graphics Device
png("Plot1.png", width=480, height = 480, units = "px", bg="white")

## Plot the Histogram
plot(hist.info, xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red",xlim=c(0,6),ylim=c(0,1200))

## Turn off the Graphics Device
dev.off()


