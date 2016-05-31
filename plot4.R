library(downloader)
DURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
DFile <- "household_power_consumption.zip"
HHF <- "household_power_consumption.txt"
##
if (!file.exists(HHF)) { download.file(DURL, DFile, mode = "wb")
  unzip(DFile, overwrite = T)}
PD <- read.table(HHF, header=T, sep=";", na.strings="?")
FD <- PD[PD$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(FD$Date, FD$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
FD <- cbind(SetTime, FD)
png("plot4.png",width = 480, height = 480)
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
CL <- c("black","red","blue")
par(mfrow=c(2,2))
plot(FD$SetTime, FD$Global_active_power, type="l", col="green", xlab="", ylab="Global Active Power")
plot(FD$SetTime, FD$Voltage, type="l", col="orange", xlab="datetime", ylab="Voltage")
plot(FD$SetTime, FD$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(FD$SetTime, FD$Sub_metering_2, type="l", col="red")
lines(FD$SetTime, FD$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=CL)
plot(FD$SetTime, FD$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")
dev.off()

