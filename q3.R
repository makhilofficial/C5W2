setwd("D:/Akhil/course_era/R/C5/W2")
activity <- read.csv("activity.csv")
activity <- na.omit(activity)
activity[,2] <- as.Date(activity[,2])

library(dplyr)
x <- group_by(activity, date)
y <- summarize(x, mean(steps), median(steps))

