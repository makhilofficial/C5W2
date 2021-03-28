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

library(dplyr)
xx <- group_by(xx, date)
z <- summarise(xx, sum(steps))

png(file = "q7.png")
hist(z$`sum(steps)`,  ylab = "Number of days", xlab = "Number of steps", 
     main = "Total number of steps taken each day")
dev.off()

meannmedian <- summarize(xx, mean(steps), median(steps))
meannmedian