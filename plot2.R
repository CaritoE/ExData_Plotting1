data <- read.csv("./household_power_consumption.txt", sep=";", header = TRUE)
data = subset(data, Date == "1/2/2007" | Date == "2/2/2007") 
GAP = data[,3]
GAP = factor(GAP)
GAP = as.numeric(GAP)
i = 1:2880
png("plot2.png", width = 480, height = 480, units = "px", bg = "white")
plot(i, GAP, type = "s", ylab = "Global ACtive Power (kilowatts)", axes = FALSE, xlab = "")
axis(2)
axis(1, at = c(0,1440, 2880), labels = c("Thursday", "Friday", "Saturday"))
box()
dev.copy(png, file = "plot2.png") 
dev.off()
