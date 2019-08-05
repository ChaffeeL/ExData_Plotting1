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

png(filename = "plot1.png", width = 480, height = 480)

# Creates the histogram and saves file
hist(power_data$Global_active_power, col="red",
     xlab="Global Active Power (killowatts)", main="Global Active Power")
dev.off()

# Removes data from workspace
rm(power_data)


