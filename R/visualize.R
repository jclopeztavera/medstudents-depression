# Data Analysis of Mexican Medical Students' PHQ-9/GAD-7/Epworth Data
# Part 4: Data visualization
# This code is licensed under a MIT License Copyright (c) 2016 Juan C. López-Tavera

source('~/github/medstudents-depression/R/loader.R')
loader("VIM")

## visualizing missing data
raw_data <- read_csv("~/github/medstudents-depression/data/raw/medstuds-depranx-data.csv")
names(raw_data) <- c("School-year", "Age", "Binary gender", "Weight", "Height", "PHQ-1", "PHQ-2", "PHQ-3", "PHQ-4", "PHQ-5", "PHQ-6", "PHQ-7", "PHQ-8", "PHQ-9", "Prior depression", "Prior anti-depressives", "GAD-1", "GAD-2", "GAD-3", "GAD-4", "GAD-5", "GAD-6", "GAD-7", "Prior anxiety", "Prior anxiolytics", "Epworth 1", "Epworth 2", "Epworth 3", "Epworth 4", "Epworth 5", "Epworth 6", "Epworth 7", "Epworth 8")

par(lty = 0)
md_plot <-
  aggr(
    raw_data,
    col = c('powderblue', 'tomato1'),
    numbers = TRUE,
    sortVars = FALSE,
    labels = names(raw_data),
    cex.axis = .5,
    gap = 3,
    ylab = c("Histogram of missing data", "Pattern of missing data")
  )

