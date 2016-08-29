# Data Analysis of Mexican Medical Students' PHQ-9/GAD-7/Epworth Data
# Part 2: Describing and Modeling the Data
# Juan C. Lopez Tavera (jc.lopeztavear@gmail.com)
# This code, written by Juan C. Lopez Tavera (jc.lopeztavear@gmail.com)
# is licensed under a Creative Commons Attribution 4.0 International License

## Installing and loading needed packages
if(!require(psych)){
  install.packages("psych")
}
library(psych)

## Basic Descriptive Statistics
summary(num.data)
summary(bool.data)
summary(factor.data)
describe(num.data)
describe(bool.data)
describe(factor.data)

## Exploring the boolean data
lapply(bool.data, sum)
tapply(depression, sex, sum)
tapply(suicidal, sex, sum)
tapply(depression, age, sum)
tapply(suicidal, age, sum)
tapply(suicidal, anxiety, sum)
tapply(depression, anxiety, sum)
tapply(anxiety, depression, sum)
tapply(anxiety, year, sum)
tapply(anxiety, sex, sum)
tapply(sleepy, depression, sum)
tapply(sleepy, anxiety, sum)
tapply(sleepy, overweight, sum)
## Q-Q plots for testing distributions


## Randomly resampling the data into training -> 80% and testing -> 20% subsets
set.seed(2345) # to make the sampling reproducible
sub <- sample(nrow(data), floor(nrow(data) * 0.8))
train <- data[sub,]
test <- data[-sub,]
