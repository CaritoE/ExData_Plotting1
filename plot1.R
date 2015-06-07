data <- read.csv("./household_power_consumption.txt", sep=";", header = TRUE)
data = subset(data, Date == "1/2/2007" | Date == "2/2/2007")
GAP = data[,3]
GAP = factor(GAP)
GAP = as.numeric(GAP)
png("plot1.png", width = 480, height = 480, units = "px", bg = "white")
hist(GAP, breaks = 12, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png") 
dev.off()
