#==========================================================================================
#                              
#       Simple Multivariate analysis of Variance(MANOVa) in R Using manova()
#                           by - Arshan Khan - E20015
#
#==========================================================================================

#loading essential libraries
library(MVN)
library(goftest)
library(nlme)
library(MASS)

#simulating multivariate data
set.seed(001)

S=matrix(c(25,10,10,25),ncol=2)
m=c(32,25)
data <- mvrnorm(n=150,mu=m,Sigma=S) 
group <- c(rep(1,50),rep(0,50),rep(2,50))

#Putting simulating data in a dataframe
data <- cbind(data,group)
colnames(data) <- c("waist","thigh","group")
data <- as.data.frame(data)
data$group <- as.factor(data$group)
View(data)

#our 2 outcome variables are waist and thigh measurement
Y <- as.matrix(cbind(data$waist,data$thigh))
g <- as.vector(data$group)

#Running our MANOVA 
m <- manova(Y~g)
summary(m)

# As per the results from the P value we can see that there is no significant
# differnce between the group meaning thigh and waste difference of 2 groups
# is similiar and no statistical differnce of evidence is found

