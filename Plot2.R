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

#Plot2
df_new$DateTime=paste(df_new$Date,df_new$Time)
plot(df_new$Global_active_power~as.POSIXct(df_new$DateTime),
     type="l",ylab ="Global Active Power (kilowatts)",xlab="")
dev.copy(png,'Plot2.png')
dev.off()
