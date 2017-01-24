# The fitted model object can be obtained using glm() function for binary responses when unit samples
# are independent. The glmer() function should be used for correlated binary responses. Only
# binary predictors are allowed. If categorization for predictors is other than (0,1), factor() should
# be considered.


b.hyp1 <- formula(depression ~ who.bmi) # hypothesis 1
b.hyp1.1 <- formula(suicidal ~ who.bmi) # hypothesis 1.1
b.hyp2 <- formula(anxiety ~ who.bmi) # hypothesis 2

if (sum(c("boot", "lme4") %in% installed.packages()) > 0) {
  install.packages(c("boot", "lme4"))
}
library(boot)
library(lme4)

glmer(formula = b.hyp1, data = train, family = binomial(link = "logit"))

