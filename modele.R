# Data Analysis of Mexican Medical Students' PHQ-9/GAD-7/Epworth Data
# Part 3: Statistical inference and modeling
# This code is licensed under a MIT License Copyright (c) 2016 Juan C. López-Tavera

# Sourcing the data as an R object
source("medstuds-depranx-dumpeddata.R")

attach(data)

## Randomly resampling the data into training (80%) and testing (20%) subsets
set.seed(112358) # to make the sampling reproducible
sub <- sample(nrow(data), floor(nrow(data) * 0.8))
train <- data[sub, ]
test <- data[-sub, ]

reality_check <-
  formula(depression ~ anxiety) # reality check, depression and anxiety should be highly correlated
hyp1 <-
  formula(depression ~ bmi) # hypothesis 1, depression (in [0,1]) as the response of BMI (continuous)
hyp1.1 <- formula(suicidal ~ bmi) # hypothesis 1.1, suicidal tendencies (in [0,1]) as the response of BMI (continuous)
hyp2 <- formula(anxiety ~ bmi) # hypothesis 2, anxiety as the response of BMI (continuous)

## Setting the models
rc.model <-
  glm(reality_check,
      family = quasibinomial(link = "logit"),
      data = train)
h1.model <-
  glm(hyp1, family = quasibinomial(link = "logit"), data = train)
h1.1.model <-
  glm(hyp1.1, family = quasibinomial(link = "logit"), data = train)
h2.model <-
  glm(hyp2, family = quasibinomial(link = "logit"), data = train)

## Summarising the reality check model
summary(rc.model) # is this the real life? is this just fantasy?

## Model selection
summary(h1.model)
add1(h1.model, ~ . + age + year + prev_depression_dx + epw.score , test = "F")
h1.model <- update(h1.model, ~ . + epw.score)
summary(h1.model)
add1(h1.model, ~ . + age + year + prev_depression_dx , test = "F")
h1.model <- update(h1.model, ~ . + prev_depression_dx)
summary(h1.model)
add1(h1.model, ~ . + age + year, test = "F")
h1.model <- update(h1.model, ~ . + age)
summary(h1.model) # intercept no longer satisfies p < 0.05

summary(h1.1.model)
add1(h1.1.model,  ~ . + age + year + prev_depression_dx + epw.score , test = "F")
h1.1.model <- update(h1.1.model, ~ . + epw.score)
summary(h1.1.model)
add1(h1.1.model, ~ . + age + year + prev_depression_dx , test = "F")
h1.1.model <- update(h1.1.model, ~ . + prev_depression_dx)
summary(h1.1.model)
add1(h1.1.model, ~ . + age + year, test = "F")
h1.1.model <- update(h1.1.model, ~ . + age)
summary(h1.1.model)
h1.1.model <- update(h1.1.model, ~ . - age)
summary(h1.1.model)

summary(h2.model) # bmi non significative, unable to reject null hypothesis
add1(h2.model, ~ . + age + year + prev_anxiety_dx + epw.score, test = "F")
h2.model <- update(h2.model, ~ . - bmi + epw.score)
summary(h2.model)
add1(h2.model, ~ . + age + year + prev_anxiety_dx, test = "F")
h2.model <- update(h2.model, ~ . + prev_anxiety_dx)
summary(h2.model)
add1(h2.model, ~ . + age + year, test = "F")
h2.model <- update(h2.model, ~ . + year)
summary(h2.model)
