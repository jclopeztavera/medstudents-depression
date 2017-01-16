# Data Analysis of Mexican Medical Students' PHQ-9/GAD-7/Epworth Data
# Part 1: Getting, Cleaning, and Preparing the Dataset
# This code is licensed under a MIT License Copyright (c) 2016 Juan C. López-Tavera

# setwd("set your path")

raw.data <-
  read.csv(
    "https://files.figshare.com/1893389/depression_data.csv",
    header = TRUE,
    sep = ","
  )
#raw dataset, n = 783#

data <-
  na.omit(raw.data) # Removing NAs from the original dataset
#new dataset, NAs removed = 26; n2 = 757#

## Setting the variables
### Body Mass Index (bmi)
data$bmi <- data$weight / data$height ^ 2

data$who.bmi <- cut(
  data$bmi,
  breaks = c(min(data$bmi), 18.5, 25, 30, max(data$bmi)),
  labels = c("underweight", "normal", "overweight", "obese"),
  include.lowest = TRUE,
  right = FALSE,
  ordered_result = TRUE
)

### Setting variable overweight acording to WHO's overweigth cutpoint
overweight <-
  rep(0, length(data$bmi)) # 0s variable of length == length(bmi)
for (i in 1:length(overweight)) {
  if (data$bmi[i] >= 25) {
    # 24 is still considered normal weight, as of 2016
    overweight[i] <- 1
  }
}

### Patient Health Questionaire 9 (PHQ-9) for screening clinical depression
### Diagnostic cutpoint: 10 (>10 == Clinical Depression)
data$phq.score <- rowSums(data[, 6:14])
depression <- cut(
  data$phq.score,
  breaks = c(min(data$phq.score), 10, max(data$phq.score)),
  labels = c("none-minimal", "clinical"),
  include.lowest = TRUE,
  right = TRUE,
  ordered_result = TRUE
)
depression <-
  as.numeric(depression) - 1 # because default levels = {1,2}

### Suicidal tendencies; PHQ-9, 9 screens for suicidal ideation
suicidal <- data$phq9
for (i in 1:length(suicidal)) {
  if (suicidal[i] > 0)
    suicidal[i] <- 1
}

### Adjusting for clinical depression as present if suicidal == 1
### Suicidal tendencies is a major criteria for clinical depression
for (i in 1:length(depression)) {
  if (suicidal[i] == 1)
    depression[i] <- 1
}

### General Anxiety Disorder Questionaire 7 (GAD-7) for screening clinical
### anxiety disorders; diagnostic cutpoint: 10 (>10 == clinical anxiety)
data$gad.score <- rowSums(data[, 17:23])
anxiety <- cut(
  data$gad.score,
  breaks = c(min(data$gad.score), 10, max(data$gad.score)),
  labels = c("none-minimal", "clinical"),
  include.lowest = TRUE,
  right = TRUE,
  ordered_result = TRUE
)
anxiety <-
  as.numeric(anxiety) - 1 # because default levels = {1,2}

### Epworth Sleepiness Scale for screening daily sleepiness/sleep disorders
### cutpoint: 10 (>10 == significant/impairing  daily sleepiness)
data$epw.score <- rowSums(data[, 26:33])
sleepy <- cut(
  data$epw.score,
  breaks = c(min(data$epw.score), 10, max(data$epw.score)),
  labels = c("none-minimal", "clinical"),
  include.lowest = TRUE,
  right = TRUE,
  ordered_result = TRUE
)
sleepy <-
  as.numeric(sleepy) - 1 # because default levels = {1,2}

## Deleting the old raw variables
data[, c(6:14, 17:23, 26:33)] <- NULL

## Appending the new variables
data <-
  cbind.data.frame(data, depression, anxiety, overweight, sleepy, suicidal)

rm(depression, anxiety, overweight, sleepy, suicidal, raw.data, i) # keeping the environment clean #

summary(data)

## Found that min(age) == 12, which is nonsense.
data[which.min(data$age), ] # note that, for this observation, year == 3;

## imputting the mean age of the observations that satisfy year == 3
data[which.min(data$age), ]$age <-
  tapply(data$age, data$year, mean)[data[which.min(data$age), ]$year]

summary(data) # looking good

# Tidy dataset, ready to go!
dput(data, file = "medstuds-depranx-data.csv")
# dump("data", file = "medstuds-depranx-dumpeddata.R") # uncomment for R-formatted data
