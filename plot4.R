# dependency
library(dplyr)

# read and filt data
dat <- read.csv2('household_power_consumption.txt',header = TRUE,
                 na.strings = '?', colClasses = 'character')
dat <- filter(dat, Date=='1/2/2007'|Date=='2/2/2007')
for (i in 3:9) dat[,i] <- as.numeric(dat[,i])
dat$datetime <- with(dat, strptime(paste(Date, Time), '%d/%m/%Y %H:%M:%S'))

# begin drawing plots
png('plot4.png')
par(mfcol = c(2, 2))

# topleft
with(dat, plot(datetime, Global_active_power, type = 'l', xlab = '', 
     ylab = 'Global Activate Power (kilowatts)'))

# bottomleft
with(dat, plot(datetime, Sub_metering_1, type = 'l', xlab = '',
     ylab = 'Energy sub metering'))
with(dat, points(datetime, Sub_metering_2, type = 'l', col = 'red'))
with(dat, points(datetime, Sub_metering_3, type = 'l', col = 'blue'))
legend('topright',legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       col = c('black','red','blue'), lwd = 1, bty = 'n')

# topright
with(dat, plot(datetime, Voltage, type = 'l'))

# bottomright
with(dat, plot(datetime, Global_reactive_power, type = 'l'))

# finish drawing plots
dev.off()