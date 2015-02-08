# dependency
library(dplyr)

# read and filt data
dat <- read.csv2('household_power_consumption.txt',header = TRUE,
                 na.strings = '?', colClasses = 'character')
dat <- filter(dat, Date=='1/2/2007'|Date=='2/2/2007')
for (i in 3:9) dat[,i] <- as.numeric(dat[,i])

# draw histogram
png('plot1.png')
hist(dat$Global_active_power, col = 'red',
     xlab = 'Global Activate Power (kilowatts)', main = 'Global Activate Power')
dev.off()