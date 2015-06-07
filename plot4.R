data <- read.csv("./household_power_consumption.txt", sep=";", header = TRUE)
data = subset(data, Date == "1/2/2007" | Date == "2/2/2007")

png("plot4.png", width = 480, height = 480, units = "px", bg = "white")
par(mfrow=c(2,2))

#First plot#
GAP = data[,3]
GAP = factor(GAP)
GAP = as.numeric(GAP)
hist(GAP, breaks = 12, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#Second plot#
i = 1:2880
Volt = data[,5]
Volt = factor(Volt)
Volt = as.numeric(Volt)
plot(i, Volt, type = "s", ylab = "Voltage", axes = FALSE, xlab = "")
axis(2)
axis(1, at = c(0,1440, 2880), labels = c("Thursday", "Friday", "Saturday"))
box()

#Third plot#
data3 = subset(data, Date == "1/2/2007" | Date == "2/2/2007", select = c(7,8,9))
data3 = cbind(i, data3)
colnames(data3) = c("x", "Sub1", "Sub2", "Sub3")
with(data3, {plot(i, Sub1,ylab = "Global ACtive Power (kilowatts)", xlab = "", type="l", col="black", axes = "FALSE")
legend(1000, 36, c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black","blue","red"))
par(new=TRUE)
plot(i, Sub2, type="l", ylab = "", xlab= "", col="red", axes = "FALSE", ylim = c(2,100))
par(new=TRUE)
plot(i, Sub3, type="l",  ylab = "", xlab= "", col="blue", axes = "FALSE", ylim = c(0,30))
axis(2)
axis(1, at = c(0,1440, 2880), labels = c("Thursday", "Friday", "Saturday"))
box()})

#Fourth plot#
GRP = data[,4]
GRP = factor(GRP)
GRP = as.numeric(GRP)
plot(i, GRP,ylab = "Global_Reactive_Power", xlab = "", type="l", col="black", axes = "FALSE")
axis(2)
axis(1, at = c(0,1440, 2880), labels = c("Thursday", "Friday", "Saturday"))
box()
dev.copy(png, file = "plot4.png") 
dev.off()

