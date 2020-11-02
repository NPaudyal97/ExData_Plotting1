library(dplyr)
dat = read.table('household_power_consumption.txt', header=TRUE, sep=';')
dat1 = filter(dat, Date=='1/2/2007' | Date=='2/2/2007')
dat1 = mutate(dat1, Global_active_power=as.numeric(Global_active_power))

png('plot1.png', width=480, height=480)
hist(dat1$Global_active_power, col='red', xlab='Global Active Power (kilowatts)', ylab='Frequency', main='Global Active Power')
dev.off()
