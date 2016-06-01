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
png("plot2.png",width = 480, height = 480)
plot(FD$SetTime, FD$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
