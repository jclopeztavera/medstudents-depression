# Data Analysis of Mexican Medical Students' PHQ-9/GAD-7/Epworth Data
# Part 2: Describing the Data
# This code is licensed under a MIT License Copyright (c) 2016 Juan C. López-Tavera

## Installing and loading needed packages
if(!require(psych)) {
  install.packages("psych")
}
library(psych)

## Basic Descriptive Statistics
summary(data)
describe(data)

#Let's make it all numeric
num.data <- matrix()
  for (i in 1:ncol(data)) {
    y <- as.numeric(unlist(data[i])) - 1 #female -> 0 male -> 1, heforshe
    num.data <- rbind(num.data, y)
    rm(y)
  }

## Q-Q plots for testing distributions



¡
