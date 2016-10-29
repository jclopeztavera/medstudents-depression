# Data Analysis of Mexican Medical Students' PHQ-9/GAD-7/Epworth Data
# Part 3: Statistical inference and modeling
# Juan C. Lopez Tavera (jclopeztavera)
# This code, written by Juan C. Lopez Tavera (jc.lopeztavera@gmail.com)
# is licensed under a Creative Commons Attribution 4.0 International License

# Sourcing the data as an R object
source("medstuds-depranx-dumpeddata.R")

attach(data)

## Randomly resampling the data into training (80%) and testing (20%) subsets
set.seed(112358) # to make the sampling reproducible
sub <- sample(nrow(data), floor(nrow(data) * 0.8))
train <- data[sub,]
test <- data[-sub,]

reallity_check <- formula(depression ~ anxiety)
hyp1 <- formula(depression + anxiety ~ sex + age + bmi)
hyp2 <- formula(depression + anxiety ~ sex:age + sex:bmi + age:bmi + sex:age:bmi)

rc.model <- glm(reallity_check, family = quasibinomial(link = "logit"), data = train)
lm(rc.model$linear.predictors ~
