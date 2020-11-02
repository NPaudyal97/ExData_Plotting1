library(dplyr)
library(lubridate)
dat = read.table('household_power_consumption.txt', header=TRUE, sep=';')
dat1 = filter(dat, Date=='1/2/2007' | Date=='2/2/2007')
dat1 = mutate(dat1, Global_active_power=as.numeric(Global_active_power), datetime = dmy_hms(paste(Date, Time)))

png('plot2.png', width=480, height=480)
plot(dat1$datetime, dat1$Global_active_power, type='l', xlab='', ylab='Global Active Power (Kilowatts)')
dev.off()
