data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses = c("character"),na.strings="?")
data$Time<-paste(data$Date,data$Time)
data$Time<-strptime(data$Time,"%d/%m/%Y %H:%M:%S")
data$Date <-as.Date(data$Date,"%d/%m/%Y")
subdata = subset(data,Date>=as.Date("2007-02-01")&Date<=as.Date("2007-02-02"))

for(i in 3:9){
  subdata[,i]<-as.numeric(subdata[,i])  
} 
data<-subdata


png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(x=data$Global_active_power,breaks=20,col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()