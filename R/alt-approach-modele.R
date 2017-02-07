# The fitted model object can be obtained using glm() function for binary responses when unit samples
# are independent. The glmer() function should be used for correlated binary responses. Only
# binary predictors are allowed. If categorization for predictors is other than (0,1), factor() should
# be considered.
if (!require(lme4)) {
  install.packages("lme4")
}
library(lme4)

source('~/GitHub/medstudents-depression/data/medstuds-depranx-dumpeddata.R')

attach(data)

## Randomly resampling the data into training (80%) and testing (20%) subsets
set.seed(112358) # to make the sampling reproducible
sub <- sample(nrow(data), floor(nrow(data) * 0.8))
train <- data[sub,]
test <- data[-sub,]


b.hyp1 <-
  formula(depression ~ who.bmi + (1 | who.bmi)) # hypothesis 1
b.hyp1.1 <-
  formula(suicidal ~ who.bmi + (1 | who.bmi)) # hypothesis 1.1
b.hyp2 <- formula(anxiety ~ who.bmi + (1 | who.bmi)) # hypothesis 2


bh1.model <-
  glmer(
    formula = b.hyp1,
    data = train,
    family = binomial(link = "logit"),
    nAGQ = 20
  )

bh1.1model <-
  glmer(
    formula = b.hyp1.1,
    data = train,
    family = binomial(link = "logit"),
    nAGQ = 20
  )

bh2.model <-
  glmer(
    formula = b.hyp2,
    data = train,
    family = binomial(link = "logit"),
    nAGQ = 20
  )
