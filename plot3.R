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
png("plot3.png",width = 480, height = 480)
CL <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(FD$SetTime, FD$Sub_metering_1, type="l", col=CL[1], xlab="", ylab="Energy sub metering")
lines(FD$SetTime, FD$Sub_metering_2, col=CL[2])
lines(FD$SetTime, FD$Sub_metering_3, col=CL[3])
legend("topright", legend=labels, col=CL, lty="solid")
dev.off()

