plot1 <- function() {
        unzip("exdata-data-household_power_consumption.zip")
        plot1data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,nrows=2075260,stringsAsFactors=FALSE)
        plot1data$Time<-strptime(paste(plot1data$Date,plot1data$Time),"%d/%m/%Y %H:%M:%S")
        plot1data$Date <- as.Date(plot1data$Date,"%d/%m/%Y")
        plot1data$Global_active_power <- as.numeric(plot1data$Global_active_power)
        plot1data <- subset(plot1data,(Date=="2007-02-01" | Date=="2007-02-02"))
        png(file="plot1.png",width=480,height=480)
        hist(plot1data$Global_active_power,xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power")
        dev.off()
}