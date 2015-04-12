plot2 <- function() {
        unzip("exdata-data-household_power_consumption.zip")
        plot2data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,nrows=2075260,stringsAsFactors=FALSE)
        plot2data$Time<-strptime(paste(plot2data$Date,plot2data$Time),"%d/%m/%Y %H:%M:%S")
        plot2data$Date <- as.Date(plot2data$Date,"%d/%m/%Y")
        plot2data$Global_active_power <- as.numeric(plot2data$Global_active_power)
        plot2data <- subset(plot2data,(Date=="2007-02-01" | Date=="2007-02-02"))
        png(file="plot2.png",width=480,height=480)
        plot(plot2data$Time,plot2data$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
        lines(plot2data$Time,plot2data$Global_active_power,type="l")
        dev.off()
}