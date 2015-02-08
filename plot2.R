# dependency
library(dplyr)

# read and filt data
dat <- read.csv2('household_power_consumption.txt',header = TRUE,
                 na.strings = '?', colClasses = 'character')
dat <- filter(dat, Date=='1/2/2007'|Date=='2/2/2007')
for (i in 3:9) dat[,i] <- as.numeric(dat[,i])
datetime <- with(dat, paste(Date, Time))
datetime <- strptime(datetime, '%d/%m/%Y %H:%M:%S')

# draw plot
png('plot2.png')
plot(datetime, dat$Global_active_power, type = 'l', xlab = '', 
     ylab = 'Global Activate Power (kilowatts)')
dev.off()