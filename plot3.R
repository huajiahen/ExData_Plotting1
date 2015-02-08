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
png('plot3.png')
plot(datetime, dat$Sub_metering_1, type = 'l', xlab = '',
     ylab = 'Energy sub metering')
points(datetime, dat$Sub_metering_2, type = 'l', col = 'red')
points(datetime, dat$Sub_metering_3, type = 'l', col = 'blue')
legend('topright',legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       col = c('black','red','blue'), lwd = 1)
dev.off()