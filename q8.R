setwd("D:/Akhil/course_era/R/C5/W2")
x <- read.csv("activity.csv")
xx <- x
head(x)

library(dplyr)
y <- group_by(x, date)
means <-  summarise(y, mean(steps))
means[is.na(means)] <- 0

for(i in 1:nrow(x)){
  if(is.na(x$steps[i])){
    xx$steps[i] <- means$`mean(steps)`[means$date == xx$date]
  }
}

xx[,2] <- as.Date(x[,2])
#isWeekend(xx[,2])])
zz <- list()
library(dplyr)
library(RcppQuantuccia)
for(i in 1:nrow(xx)){
  zz[i] <- isWeekend(xx[i,2])
}

for(i in 1:nrow(xx)){
  mutate(xx, weekends = zz[i])
}

xx$day <- weekdays(xx[,2])

xx[,4] <- gsub(c('Monday'), 'Weekday', xx[,4])
xx[,4] <- gsub(c( 'Tuesday'), 'Weekday', xx[,4])
xx[,4] <- gsub(c( 'Wednesday'), 'Weekday', xx[,4])
xx[,4] <- gsub(c('Thursday'), 'Weekday', xx[,4])
xx[,4] <- gsub(c( 'Friday'), 'Weekday', xx[,4])
xx[,4] <- gsub(c('Saturday'), 'Weekend', xx[,4])
xx[,4] <- gsub(c('Sunday'), 'Weekend', xx[,4])


averages <- aggregate(steps ~ interval + day, data = xx, mean)


png(file = "q8.png")
qplot(interval, steps, data = averages, facets = day ~ ., 
      main = "Average Number of Steps - Weekday vs. Weekend",
      geom = 'line')
dev.off()