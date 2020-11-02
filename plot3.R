library(dplyr)
library(lubridate)
dat = read.table('household_power_consumption.txt', header=TRUE, sep=';')
dat1 = filter(dat, Date=='1/2/2007' | Date=='2/2/2007')

dat1 = dat1 %>% mutate(datetime = dmy_hms(paste(Date, Time))) %>%
    mutate(Sub_metering_1=as.numeric(Sub_metering_1)) %>%
    mutate(Sub_metering_2=as.numeric(Sub_metering_2)) %>%
    mutate(Sub_metering_3=as.numeric(Sub_metering_3))

png('plot3.png', width=480, height=480)
plot(dat1$datetime, dat1$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(dat1$datetime, dat1$Sub_metering_2, col='red')
lines(dat1$datetime, dat1$Sub_metering_3, col='blue')
legend('topright', bty='n', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1, lwd=1, col=c('black','red','blue'))
dev.off()
