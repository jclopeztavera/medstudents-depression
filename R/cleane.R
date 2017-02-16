# Data Analysis of Mexican Medical Students' PHQ-9/GAD-7/Epworth Data
# Part 1: Getting, Cleaning, and Preparing the Dataset
# This code is licensed under a MIT License Copyright (c) 2016 Juan C. López-Tavera

rm(list = ls())

source('~/github/medstudents-depression/R/loader.R')
loader("readr", "dplyr")

#raw_data <- read_csv("https://files.figshare.com/1893389/depression_data.csv")

raw_data <- read_csv("~/github/medstudents-depression/data/raw/medstudents-depression-raw.csv")

## Found that min(age) == 12, which is nonsense;
## imputting the mean age of the observations that satisfy year == 3
raw_data[which.min(raw_data$age),]$age <-
  tapply(raw_data$age, raw_data$year, mean)[raw_data[which.min(raw_data$age),]$year]

## exporting raw dataset to this repository
write_csv(x = raw_data, path = "~/github/medstudents-depression/data/raw/medstudents-depression-raw.csv")

data <-
  na.omit(raw_data) # Removing NAs from the original dataset
# new dataset, NAs removed = 26; n2 = 757

data$sex <- as.factor(data$sex)

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
data$overweight <- rep(0, nrow(data))
for (i in 1:length(data$bmi)) {
  if (data$bmi[i] >= 25) {
    # 24 is still considered normal weight, as of 2016
    data$overweight[i] <- 1
  }
}

### Patient Health Questionaire 9 (PHQ-9) for screening clinical depression
### Diagnostic cutpoint: 10 (>10 == Clinical Depression)
data$phq.score <- rowSums(data[, 6:14])

### Depression scale according to the PHQ-9 and GAD-7 Manual
data$phq.scale <-
  cut(
    x = data$phq.score,
    breaks = c(0, 5, 10, 15, 20, 27),
    right = FALSE,
    include.lowest = TRUE,
    ordered_result = TRUE,
    labels = c(
      "None-minimal",
      "Mild",
      "Moderate",
      "Moderately severe",
      "Severe"
    )
  )

data$depression <- rep(0, nrow(data))
for (i in 1:nrow(data)) {
  if (data$phq.score[i] >= 10) {
    data$depression[i] <- 1
  }
}

### Suicidal tendencies; PHQ-9, 9 screens for suicidal ideation
data$suicidal <- data$phq9
for (i in 1:nrow(data)) {
  if (data$suicidal[i] > 0)
    data$suicidal[i] <- 1
}

### Adjusting for clinical depression as present if suicidal == 1
### Suicidal tendencies is a major criteria for clinical depression
for (i in 1:nrow(data)) {
  if (data$suicidal[i] == 1)
    data$depression[i] <- 1
}

for (i in 1:nrow(data)) {
  if (data$suicidal[i] == 1)
    data$phq.scale[i] <- "Severe"
}

### General Anxiety Disorder Questionaire 7 (GAD-7) for screening clinical
### anxiety disorders; diagnostic cutpoint: 10 (>10 == clinical anxiety)
data$gad.score <- rowSums(data[, 17:23])

### Anxiety scale according to the PHQ-9 and GAD-7 Manual
data$gad.scale <-
  cut(
    data$gad.score,
    breaks = c(0, 5, 10, 15, 21),
    labels = c("None-minimal", "Mild", "Moderate", "Severe"),
    include.lowest = TRUE,
    right = FALSE,
    ordered_result = TRUE
  )

data$anxiety <- rep(0, nrow(data))
for (i in 1:nrow(data)) {
  if (data$anxiety[i] >= 10) {
    data$anxiety[i] <- 1
  }
}

### Epworth Sleepiness Scale for screening daily sleepiness/sleep disorders
### cutpoint: 10 (>10 == significant/impairing  daily sleepiness)
data$epw.score <- rowSums(data[, 26:33])

data$epw.scale <- cut(
  data$epw.score,
  breaks = c(min(data$epw.score), 10, max(data$epw.score)),
  labels = c("Normal", "Sleep Disorder"),
  include.lowest = TRUE,
  right = FALSE,
  ordered_result = TRUE
)

data$sleepy <-
  as.numeric(data$epw.scale) - 1 # because default levels = {1,2}

# Tidy dataset, ready to go!
#write.csv(data, file = "~/github/medstudents-depression/data/processed/medstudents-depression.csv", row.names = FALSE)
#dump("data", file = "~/github/medstudents-depression/data/processed/medstudents-depression.R") # uncomment for R-formatted data

rm(i, loader, raw_data)
