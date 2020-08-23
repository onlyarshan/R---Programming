#==========================================================================================
#                              
#                      Linear Discriminant Analysis
#                           by - Arshan and Yash
#
#==========================================================================================


# Data
data("iris")
str(iris)

# Data partition
set.seed(555)
ind <- sample(2, nrow(iris),
              replace = TRUE,
              prob = c(0.7, 0.3)) #70-30% partiion 
training <- iris[ind==1,] #training set

# Linear discriminant analysis
library(MASS)
lda_train <- lda(Species~., training)
lda_train # our model


