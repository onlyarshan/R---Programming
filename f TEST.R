#==========================================================================================
#                              
#               The partial F - testin R Using Lungcapdata
#                           by - Arshan and Yash
#
#==========================================================================================

#################################################
### 
###  Let us state our Ho and Ha hypotheses for these tests
###
###  Testing Ho: models Do not significantly differ
###          Ha: full model(Model with Height) is significantly better

#Import the LungCapData
LungCapData <- read.table(file.choose(),header = T, sep ="\t")
#Attach the LungCapData
attach(LungCapData)
#Check the variable names
names(LungCapData)

#

#fir the FULL Model, and call it modelx
modelfull <- lm(LungCap ~ Age + Gender + Smoke + Height)

#fit reduced model and call it modelred
modelred <- lm(LungCap ~ Age + Gender + Smoke )

#Compare the 2 using a Partial F - test
anova(modelfull,modelred)

#we can see p value is extermely small so the model which has height 
#that is "modelfull" is better in estimating Lungcap
