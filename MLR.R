#==========================================================================================
#                              
#               Multinomial Logistic Regression - Using R
#                           by - Arshan and Yash
#
#==========================================================================================
mydata =  read.csv('C:/Users/Admin/Downloads/Cardiotocographic.csv')
View(mydata)
str(mydata)
#here the last variable NSP is the dependant variables that depends on 
#all the other variables 
#                       when NSP=1(N) - normal patient 
#                       when NSP=2(S) - suspect patient 
#                       when NSP=3(P) - pathological patient 

mydata$NSP <- as.factor(mydata$NSP) #converting int to factor variable

#Data partitioning
set.seed(222)
ind<-sample(2,nrow(mydata),
            replace=TRUE,
            prob = c(0.7,0.3)) #splitting 30-70 partition
training <- mydata[ind==1,]
testing <- mydata[ind==2,]

#Multinomial Logistical Regression
library(nnet)
training$NSP <- relevel(training$NSP,ref="1")
mymodel <- multinom(NSP~.,data = training)
summary(mymodel)

#here we can see 21 variables and we need to find out which variables are statistically
#significant. for this we will do a z tailed test

z <- summary(mymodel)$coefficients/summary(mymodel)$standard.errors
P <- (1-pnorm(abs(z),0,1))*2
P

#hERE WE CAN SEE MLTV, Width,Min, Max, Nmax,Nzeros are not statistically significant
mymodel <- multinom(NSP~.-MLTV-MSTV-Width -Min -Max -Nmax -Nzeros,data = training)
summary(mymodel)

#Now using the coefficients we can write our first equation and using the 2nd
#one we can write our second equation 

#ln[P(NSP=2)/P(NSP=1)]=-18.11787+(-0.09069851)LB + (-1056.6643)*AC.....+(-0.1726295)*Tendency
#ln[P(NSP=3)/P(NSP=1)]=17.77096+(0.40439088)LB + (-246.5344)*AC.....+(-0.1272335)*Tendency
