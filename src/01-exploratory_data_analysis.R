#' ---
#' title: Analysis of Mexican medical students' mental health data: Exploratory data analysis
#' author: "Juan C. López Tavera"
#' date: "2019-06-11"
#' license: MIT License Copyright (c) 2016-2018 Juan C. López Tavera
#' ---

# Loading required data + packages in the project
if (!require(ProjectTemplate)) {
  install.packages("ProjectTemplate")
  library(ProjectTemplate)
}
load.project()

if (!require(tidyverse)) {
  install.packages("tidyverse")
  library(tidyverse)
}

# Distributions ----
## Exploring if the distributions of numeric vars are normal or not,
## According to the Shapiro-Wilk Normality Test
is_normal <- function(x) {
  z <- lapply(x[sapply(x, is.numeric)], shapiro.test)
  for (i in 1:length(z)) {
    if (z[[i]]$p.value >= 0.1) {
      message(paste(names(z[i]), "has a normal distribution"))
    } else {
      message(paste(names(z[i]), "does *not* have a normal distribution"))
    }
  }
}

is_normal(depression_anxiety_data)
is_normal(depression_anxiety_survey_data)

### There are no normally-distributed variables

## Mental health variables look Poisson-like
depression_anxiety_data %>%
  select(id, contains("score")) %>%
  gather("key", "value", -id) %>%
  ggplot(data = ., mapping = aes(x = value, fill = key, colour = key)) +
  geom_density(alpha = 0.3)

depression_anxiety_data %>%
  select(id, contains("score")) %>%
  gather("key", "value", -id) %>%
  ggplot(data = ., mapping = aes(x = key, y = value, fill = key)) +
  geom_boxplot(outlier.alpha = 0.3, alpha = 0.7) +
  geom_jitter(width = 0.1, alpha = 0.03)


## Plotting BMI against a parameter-equivalent simulated normal BMI distribution
set.seed(42)
depression_anxiety_data %>%
  select(id, matches("^bmi")) %>%
  gather("key", "value", -id) %>%
  bind_rows(tibble(
    id = as.character(1:nrow(.)),
    key = "simultated_bmi",
    value = rnorm(
      n = nrow(.),
      mean = mean(.$value, na.rm = T),
      sd = sd(.$value, na.rm = T)
    )
  )) %>%
  ggplot(data = .,
         mapping = aes(x = value, fill = key, colour = key)) +
  geom_density(alpha = 0.5)

## They look similar, we can note a little bump at the upper tail of the distribution and a mild positive skewness

set.seed(42)
depression_anxiety_data %>%
  select(id, matches("^bmi")) %>%
  gather("key", "value", -id) %>%
  bind_rows(tibble(
    id = as.character(1:nrow(.)),
    key = "simultated_bmi",
    value = rnorm(
      n = nrow(.),
      mean = mean(.$value, na.rm = T),
      sd = sd(.$value, na.rm = T)
    )
  )) %>%
  ggplot(data = ., mapping = aes(x = key, y = value, fill = key)) +
  geom_boxplot(outlier.alpha = 0.3, alpha = 0.7) +
  geom_jitter(width = 0.1, alpha = 0.03)

## We can appreciate that there are more "obese" outliers that would have been expected from a normal distribution.

# Survey exploration ----

## First, only survey data
### Depression survey data
depression_anxiety_survey_data %>%
  select(-c(phq_score:anxiety_treatment)) %>%
  gather("key", "value", -id) %>%
  filter(grepl("phq", key)) %>%
  ggplot(data = .,
         aes(x = factor(value),
             label = key,
             colour = factor(value),
             fill = factor(value))) +
  geom_bar(stat = "count") +
  coord_flip() +
  facet_grid(key~.)

#### 0s become more frequent along the questionnaire, while 1s become less frequent. 2s peak at the middle of the questionnaire, 3s and NAs seem to remain constant

## Anxiety questionnaire data
depression_anxiety_survey_data %>%
  select(-c(phq_score:anxiety_treatment)) %>%
  gather("key", "value", -id) %>%
  filter(grepl("gad", key)) %>%
  ggplot(data = .,
         aes(x = factor(value),
             label = key,
             colour = factor(value),
             fill = factor(value))) +
  geom_bar(stat = "count") +
  coord_flip() +
  facet_grid(key~.)

## Sleepiness data
depression_anxiety_survey_data %>%
  select(-c(phq_score:anxiety_treatment)) %>%
  gather("key", "value", -id) %>%
  filter(grepl("epw", key)) %>%
  ggplot(data = .,
         aes(x = factor(value),
             label = key,
             colour = factor(value),
             fill = factor(value))) +
  geom_bar(stat = "count") +
  coord_flip() +
  facet_grid(key~.)


# Reality checks ----
## Age should increase with school year...
qplot(x = school_year, y = age, data = depression_anxiety_data, geom = "smooth")
### and it does


