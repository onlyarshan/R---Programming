#==========================================================================================
#                                Power Of a Test
#==========================================================================================

#the formula of a power of a statistical Hypothesis test is given by:
#                 power = 1-TypeII error

#################################################
### 
###  Determining power of a test in R.
###
###  Testing Ho: mu = 5
###          Ha: mu > 5
###  
###  Sample size n = 15
###
###  Sample mean xbar = 5.23
###  Sample stdev stdv = 1.32
###
###  Significance level sig.level = 0.05
###

power.t.test( n = 15,                    # Sample Size
              delta = 0.23,              # Difference between mu and xbar
              sd = 1.32,                 # Standard Deviation
              sig.level = 0.05,          # Significance level
              type = "one.sample",       # Type of study
              alternative = "one.sided"  # Type of test
)

###################################################
###  For a two sided two sample test.
###  Testing Ho: mu1 = mu2
###          Ha: mu1 <> mu2

power.t.test( n = 15,                    # Sample Size
              delta = 1.6,               # xbar2 - xbar1
              sd = 2.14,                 # Standard Deviation
              sig.level = 0.05,          # Significance level
              type = "two.sample",       # Type of study
              alternative = "two.sided"  # Type of test
)


