# Installing mlbench Package
install.packages('mlbench')

# Initializing Library mlbench
library(mlbench)

# Loading data of BreastCancer in package mlbench
data(BreastCancer, package="mlbench")

# Placing the data from BreastCancer to bc by keeping complete rows
bc <- BreastCancer[complete.cases(BreastCancer), ]

# Viewing the content of bc
View(bc)

# Removing ID Column (First Column)
bc <- bc[,-1]

# Converting to Numeric from Character
for(i in 1:9) {bc[, i] <- as.numeric(as.character(bc[, i]))}

# Changing 'Class' values to 1's (Malignant) and 0's (Benign)
bc$Class <- ifelse(bc$Class == "malignant", 1, 0)
bc$Class <- factor(bc$Class, levels = c(0, 1))

# Preparing Training and Test Data.
library(caret)
'%ni%' <- Negate('%in%')  # define 'not in' func
options(scipen=999)  # prevents printing scientific notations.
set.seed(100)
trainDataIndex <- createDataPartition(bc$Class, p=0.7, list = F)
trainData <- bc[trainDataIndex, ]
testData <- bc[-trainDataIndex, ]

# Class distribution of train data
table(trainData$Class)
table(testData$Class)
prop.table(table(trainData$Class))
prop.table(table(testData$Class))

# Down Sampling Imbalanced Data
set.seed(100)
down_train <- downSample(x = trainData[, colnames(trainData) %ni% "Class"], y = trainData$Class)
table(down_train$Class)

# Up Sampling Imbalanced Data, it is optional
set.seed(100)
up_train <- upSample(x = trainData[, colnames(trainData) %ni% "Class"],y = trainData$Class)

table(up_train$Class)

# Building Logistic Regression Model
logitmod <- glm(Class ~ Cl.thickness + Cell.size + Cell.shape, family = "binomial", data=down_train)

summary(logitmod)

pred <- predict(logitmod, newdata = testData, type = "response")
pred

# Recoding Factors
y_pred_num <- ifelse(pred > 0.5, 1, 0)
y_pred <- factor(y_pred_num, levels=c(0, 1))
y_act <- testData$Class

# Finding Accuracy
mean(y_pred == y_act)
