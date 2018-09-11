# Data Analysis of Mexican Medical Students' PHQ-9/GAD-7/Epworth Data
# Part 4: Data visualization
# This code is licensed under a MIT License Copyright (c) 2016 Juan C. López-Tavera

loader("VIM", "ggplot2", "readr", "ggthemes")

## visualizing missing data
raw_data <-
  read_csv(file = "data/raw/raw_data.csv")
names(raw_data) <-
  c(
    "School-year",
    "Age",
    "Binary gender",
    "Weight",
    "Height",
    "PHQ-1",
    "PHQ-2",
    "PHQ-3",
    "PHQ-4",
    "PHQ-5",
    "PHQ-6",
    "PHQ-7",
    "PHQ-8",
    "PHQ-9",
    "Prior depression",
    "Prior anti-depressives",
    "GAD-1",
    "GAD-2",
    "GAD-3",
    "GAD-4",
    "GAD-5",
    "GAD-6",
    "GAD-7",
    "Prior anxiety",
    "Prior anxiolytics",
    "Epworth 1",
    "Epworth 2",
    "Epworth 3",
    "Epworth 4",
    "Epworth 5",
    "Epworth 6",
    "Epworth 7",
    "Epworth 8"
  )

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
par(lty = 1)

ddp <-
  ggplot(
    data = data,
    mapping = aes(x = phq.score, fill = phq.scale, colour = phq.scale)
  )
ddp <- ddp +
  geom_density(alpha = 0.5, adjust = 1.5) +
  theme_base() +
  scale_fill_ptol(name = "Depression Severity") +
  scale_color_ptol(name = "Depression Severity") +
  labs(
    list(title = "Distribution of PHQ-9 Scores by Depression Severity", x = "PHQ-9 Score", y = "Density")
  ) +
  expand_limits(x = c(0,27))

gdp <-  ggplot(
    data = data,
    mapping = aes(x = gad.score, fill = gad.scale, colour = gad.scale)
  )
gdp <- gdp +
  geom_density(alpha = 0.5, adjust = 1.5) + theme_base() +
  scale_fill_ptol(name = "Anxiety Severity") +
  scale_color_ptol(name = "Anxiety Severity") +
  labs(
    list(title = "Distribution of GAD-7 Scores by Anxiety Severity", x = "GAD-7 Score", y = "Density")
  ) + expand_limits(x = c(0,21))
