setwd("C:/Users/Admin/DataSc_Kunti/ExploratoryData")
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"house_power.zip")
zipF<- "house_power.zip"
outDir<-"C:/Users/Admin/DataSc_Kunti/ExploratoryData"
unzip(zipF,exdir=outDir)

df<-read.table("household_power_consumption.txt",
               header=TRUE,na.strings = "?",
               sep = ";")
df$Date<-as.Date(df$Date,"%d/%m/%Y")
time<-strptime(df$Time,"%H:%M:%S")
df$time<-strftime(time, '%H:%M:%S')




#Plot3
plot(df_new$Sub_metering_1~as.POSIXct(df_new$DateTime),
     type="l",ylab ="Energy sub metering",xlab="")
points(df_new$Sub_metering_2~as.POSIXct(df_new$DateTime),type="l",col="red")
points(df_new$Sub_metering_3~as.POSIXct(df_new$DateTime),type="l",col="blue")
legend("topright",lwd = c(1,1,1),col = c('black','red','blue'),c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.copy(png,'Plot3.png')
dev.off()
