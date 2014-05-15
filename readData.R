readData<-function()
{
  data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses = c("character"),na.strings="?")
  data$Time<-paste(data$Date,data$Time)
  data$Time<-strptime(data$Time,"%d/%m/%Y %H:%M:%S")
  data$Date <-as.Date(data$Date,"%d/%m/%Y")
  subdata = subset(data,Date>=as.Date("2007-02-01")&Date<=as.Date("2007-02-02"))
  
  for(i in 3:9){
    subdata[,i]<-as.numeric(subdata[,i])  
  } 
  return(subdata)
}

