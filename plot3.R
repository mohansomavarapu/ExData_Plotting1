plot3 <- function() {
        unzip("exdata-data-household_power_consumption.zip")
        plot3data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,nrows=2075260,stringsAsFactors=FALSE)
        plot3data$Time<-strptime(paste(plot3data$Date,plot3data$Time),"%d/%m/%Y %H:%M:%S")
        plot3data$Date <- as.Date(plot3data$Date,"%d/%m/%Y")
        plot3data$Global_active_power <- as.numeric(plot3data$Global_active_power)
        plot3data <- subset(plot3data,(Date=="2007-02-01" | Date=="2007-02-02"))
        png(file="plot3.png",width=480,height=480)
        plot(plot3data$Time,plot3data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",col="black")
        lines(plot3data$Time,plot3data$Sub_metering_2,type="l",col="red")
        lines(plot3data$Time,plot3data$Sub_metering_3,type="l",col="blue")
        legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=2)
        dev.off()
}