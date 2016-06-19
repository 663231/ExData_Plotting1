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
hist(data$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

####Save the file####
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
