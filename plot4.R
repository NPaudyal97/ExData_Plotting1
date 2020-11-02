library(dplyr)
library(lubridate)
dat = read.table('household_power_consumption.txt', header=TRUE, sep=';')
dat1 = filter(dat, Date=='1/2/2007' | Date=='2/2/2007')

dat1 = dat1 %>% mutate(datetime = dmy_hms(paste(Date, Time))) %>%
    mutate(Global_active_power=as.numeric(Global_active_power)) %>%
    mutate(Voltage=as.numeric(Voltage)) %>%
    mutate(Global_reactive_power=as.numeric(Global_reactive_power)) %>%
    mutate(Sub_metering_1=as.numeric(Sub_metering_1)) %>%
    mutate(Sub_metering_2=as.numeric(Sub_metering_2)) %>%
    mutate(Sub_metering_3=as.numeric(Sub_metering_3))

png('plot4.png', width=480, height=480)
# Plot column-wise 
par(mfcol=c(2,2))

plot(dat1$datetime, dat1$Global_active_power, type='l', xlab='', ylab='Global Active Power (Kilowatts)')

plot(dat1$datetime, dat1$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(dat1$datetime, dat1$Sub_metering_2, col='red')
lines(dat1$datetime, dat1$Sub_metering_3, col='blue')
legend('topright', bty='n', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1, lwd=1, col=c('black','red','blue'))

plot(dat1$datetime, dat1$Voltage, type='l', xlab='datetime', ylab='Voltage')

plot(dat1$datetime, dat1$Global_reactive_power, type='l', xlab='datetime', ylab='Global_reactive_power')

dev.off()
