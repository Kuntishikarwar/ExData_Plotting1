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

#Plot1
df_new<-df[df$Date=='2007-02-01' | df$Date=='2007-02-02',]
hist(df_new$Global_active_power,
     col="red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.copy(png,'Plot1.png')
dev.off()
