data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses = c("character"),na.strings="?")
data$Time<-paste(data$Date,data$Time)
data$Time<-strptime(data$Time,"%d/%m/%Y %H:%M:%S")
data$Date <-as.Date(data$Date,"%d/%m/%Y")
subdata = subset(data,Date>=as.Date("2007-02-01")&Date<=as.Date("2007-02-02"))

for(i in 3:9){
  subdata[,i]<-as.numeric(subdata[,i])  
} 
data<-subdata

png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(data$Time,data[,7],type='l',ylab="Energy submetering",xlab="",col="black")
lines(data$Time,data[,8],type='l',col="red")
lines(data$Time,data[,9],type='l',col="blue")
legend("topright", col=c("black", "blue", "red"), cex = 0.95, lty=1,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()