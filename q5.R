setwd("D:/Akhil/course_era/R/C5/W2")
x0 <- read.csv("activity.csv")
x0 <- na.omit(x0)
x0[,2] <- as.Date(x0[,2])

library(dplyr)
x <- group_by(x0, interval)
y <- summarize(x, mean(steps))

maximum <- sapply(y, max)
print("The 5-minute interval that, on average, 
      contains the maximum number of steps:")
maximum

