# Data Analysis of Mexican Medical Students' PHQ-9/GAD-7/Epworth Data
# Part 2: Describing the Data
# This code is licensed under a MIT License Copyright (c) 2016 Juan C. López-Tavera

## Installing and loading needed packages
if (!require(psych)) {
  install.packages("psych")
}
library(psych)

## Loading data
source('~/github/medstudents-depression/data/medstuds-depranx-dumpeddata.R')

## Basic-general Descriptive Statistics
str(data)
summary(data)
describe(data)

attach(data) # for ease of typing

### Description of Demographics Data
tapply(age, sex, mean) # age by gender
round(tapply(age, year, mean)) # rounded mean age by shool year
tapply(sex, year, summary) # counts of binary gender by school year

### Description Depression and Suicidal Tendencies Data
sum(depression) # depressed people
tapply(depression, sex, sum) # depressed people by gender
tapply(depression, who.bmi, sum) # depressed people by WHO-BMI category
tapply(depression, year, sum) # depressed people by school year
sum(suicidal) # suicidal people
tapply(suicidal, sex, sum) # suicidal people by gender
tapply(suicidal, who.bmi, sum) # suicidal people by WHO-BMI category
tapply(suicidal, year, sum) # suicidal people by school year

### Description of Anxiety Data
sum(anxiety) # anxious people
tapply(anxiety, sex, sum) # anxious people by gender
tapply(anxiety, who.bmi, sum) # anxious people by WHO-BMI category
tapply(anxiety, year, sum) # suicidal people by school year

### Description of Body-mass Index Data
sum(overweight) # all people
sum(who.bmi == "obese") # obese people
round(tapply(bmi, sex, mean), 2) # rounded mean BMI by gender
round(tapply(bmi, who.bmi, mean), 2) # rounded mean BMI by WHO-BMI category
round(tapply(bmi, year, mean), 2) # rounded mean BMI by year
round(tapply(bmi, depression, mean), 2) # rounded mean BMI by depression state
round(tapply(bmi, anxiety, mean), 2) # rounded mean BMI by anxiety state

### Description of control variables


### Exploring distributions
is.normal <- function(x) {
  z <- lapply(x[sapply(x, is.numeric)], shapiro.test)
  for (i in 1:length(z)) {
    if (z[[i]]$p.value >= 0.1) {
      message(paste(names(z[i]), "has a normal distribution"))
    } else {
      message(paste(names(z[i]), "has a non-normal distribution"))
    }
  }
}

is.normal(data) # all variables have non-normal distributions
