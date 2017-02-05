# The fitted model object can be obtained using glm() function for binary responses when unit samples
# are independent. The glmer() function should be used for correlated binary responses. Only
# binary predictors are allowed. If categorization for predictors is other than (0,1), factor() should
# be considered.
if (sum(c("boot", "lme4") %in% installed.packages()) > 0) {
  install.packages(c("boot", "lme4"))
}
library(boot)
library(lme4)

source("medstuds-depranx-dumpeddata.R")

attach(data)

## Randomly resampling the data into training (80%) and testing (20%) subsets
set.seed(112358) # to make the sampling reproducible
sub <- sample(nrow(data), floor(nrow(data) * 0.8))
train <- data[sub,]
test <- data[-sub,]

b.hyp1 <- formula(depression ~ bmi + (1 | who.bmi)) # hypothesis 1
b.hyp1.1 <- formula(suicidal ~ who.bmi) # hypothesis 1.1
b.hyp2 <- formula(anxiety ~ who.bmi) # hypothesis 2


glmer(formula = b.hyp1, data = train, family = binomial(link = "logit"), nAGQ = 9) %>% plot

