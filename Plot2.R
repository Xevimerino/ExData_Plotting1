#First step is download and unzip the file in your working directory
dir.create("./Data")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","./Data/exdata-data-household_power_consumption.zip")
unzip("./Data/exdata-data-household_power_consumption.zip",exdir="./Data")
#Then we read the whole table
hhpwrc<-read.table("./Data/household_power_consumption.txt",na.strings="?",sep=";",header=T)
#Modify the Date column to be readed as a date
hhpwrc[,"Date"] <- as.Date(hhpwrc[,"Date"],format="%d/%m/%Y")
#Then we subset it, to the values we are interested in
hhpwrc2<-hhpwrc[hhpwrc[,"Date"] >= ("2007-02-01")&hhpwrc[,"Date"] <= ("2007-02-02"),]
#And we create a new list mixing the date and time columns and give it a date format
hhpwrc2[,"Date"]<-paste(hhpwrc2[,"Date"],hhpwrc2[,"Time"],sep=" ")
Date<-strptime(hhpwrc2[,"Date"],format="%Y-%m-%d %H:%M:%S")
#Added this line in order to have the days in the x-axis in English
Sys.setlocale("LC_TIME", "English")

#plot2
png("Plot2.png")
#Setting the background to transparent to match the figures in the repository
  par(bg="transparent")
plot(Date,hhpwrc2[,"Global_active_power"],
     t="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()