#Exercise
age<-c(18:29)
age
hieght<-c(76.1,77,78.1,78.2,78.8,79.7,79.9,81.1,81.2,81.8,82.8,83.5)
hieght

df<-data.frame(age,hieght)
df
plot(age~hieght)
result<-lm(age~hieght)
summary(result)

#Eq: Age= -100.84 + 1.55*Hieght

#Accuracy:
#Since R2 is close to 1, hence model is highly significant.

data_fitted<-data.frame(df, fitted.value=fitted(result), residual)


#Exercise 2:
names(mtcars)
View(mtcars)
plot(mpg~hp, data=mtcars)
plot(mpg~wt, data = mtcars)
result<-lm(mpg~hp+wt, data=mtcars)
summary(result)

result<-lm(mpg~hp+wt, data=mtcars)
summary(result)

#Example 3:
#Create Training and Test data ---
trainingRowIndex <- sample(1:nrow(mtcars), 0.8*nrow(mtcars))   #row indices for training data
trainingData <- mtcars[trainingRowIndex, ]    # model training data
testData <- mtcars[-trainingRowIndex, ]    # test data

#Bi-variate Analysis:---
#Checking relationships between different variables
pairs(mtcars)

#Correlation
cr = cor(mtcars)
cr
library(corrplot)
corrplot(cr, type="lower", method="circle")
corrplot(cr, type="lower", method="number")

#Build the model on training data---
lmMod <- lm(mpg ~ cyl+disp+hp+wt, data=trainingData)  # build the model
# Review diagnostic measures
summary(lmMod)   #model summary

#Accuracy:
#Since R2 is close to 1, i.e., 0.84, hence model is significant.

#Prediction---
#Predicting values for test dataset
testData$mpgPred <- predict(lmMod, testData)

#Accuracy:---
#Determining Prediction accuracy on test dataset using MAPE

#MAPE(MeansAbsolutePercentageError):
#Lower its value better is the accuracy of the model.
#MAPE Calculation;
mape <- mean(abs((testData$mpgPred - testData$mpg))/testData$mpg)
mape