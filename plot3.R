library(lubridate)
# Reads in, subsets, and formats data. Note that we will still need enough
# room to read in the entire table, even though we get rid of it

power_data <- read.table("household_power_consumption.txt",
                       header=TRUE, sep=";", colClasses =
                         c("character", "character", "numeric", "numeric",
                           "numeric", "numeric", "numeric", "numeric",
                           "numeric"),
                       na.strings="?")

power_data$Date <- dmy(power_data$Date)
power_data$Time <- hms(power_data$Time)
power_data <- subset(power_data, "2007-02-01" <= Date &
                       Date <= "2007-02-02")

# Opens appropriate graphic device

png(filename = "plot3.png", width = 480, height = 480)

# Creates the plot and saves file
with(power_data, plot(Date+Time, Sub_metering_1, type="n",
                      ylab="Energy sub metering", xlab = " "))
with(power_data, lines(Date+Time, Sub_metering_1, col="black"))
with(power_data, lines(Date+Time, Sub_metering_2, col="red"))
with(power_data, lines(Date+Time, Sub_metering_3, col="blue"))
legend("topright", lty=c(1, 1, 1), col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

# Removes data from workspace
rm(power_data)


