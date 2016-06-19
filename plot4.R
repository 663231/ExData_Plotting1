######Load all data######
## read.csv to read file
## header is set to TRUE if the first row contains one fewer field than the number of columns
##stringAsFactors=F do not convert character vectors to factors
##nrow given number of rows is 2075259
## quote (single quote) ASCII apostrophe
## na.strings ="?" the missin values are named as "?"
data_all <- read.csv("/Users/weiweiguan/Desktop/R explore/Assign week 1/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#####################################
######Subset the data######
##only use data from 01/02/2007 to 02/02/2007
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")
data <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_all)

############################################
#####Converting dates####
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

####Plotting#############
par(mfrow=c(2,2), mar=c(4,4,2,1),oma=c(0,0,2,0))
with(data, {

plot(Global_active_power~Datetime, type="l", 

ylab="Global Active Power (kilowatts)", xlab="")

plot(Voltage~Datetime, type="l", 

ylab="Voltage (volt)", xlab="")

plot(Sub_metering_1~Datetime, type="l", 

         ylab="Global Active Power (kilowatts)", xlab="")

lines(Sub_metering_2~Datetime,col='Red')

lines(Sub_metering_3~Datetime,col='Blue')

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",

legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(Global_reactive_power~Datetime, type="l", 

         ylab="Global Rective Power (kilowatts)",xlab="")

})

####Save the file####
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
