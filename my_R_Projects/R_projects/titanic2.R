library(tidyverse)
library(reshape2)
train<- read.csv('datasets/titanic/train.csv')
test<- read.csv('datasets/titanic/test.csv')

head(train)
summary(train)
#Change Sex to a factor so it can be processed by Random Forest
#Replace null values in Age with median

apply(train, 2, function(x) is.na(x))
apply(df,2, function(x) is.na(x))

train$Sex<- as.factor(train$Sex)
train$Survived<- as.factor(train$Survived)
train$Pclass <- as.factor(train$Pclass)

train$Age[is.na(train$Age)] = median(train$Age, na.rm=TRUE)
summary(train)

drops = list("PassengerId", 'Ticket', 'Cabin', 'Name', 'Embarked')
train = train[ , !(names(train) %in% drops)]

#test munge

test$Survived <- 1

test$Sex<- as.factor(test$Sex)
test$Survived<- as.factor(test$Survived)
test$Pclass <- as.factor(test$Pclass)

test$Age[is.na(test$Age)] = median(test$Age, na.rm=TRUE)
summary(test)

drops = list("PassengerId", 'Ticket', 'Cabin', 'Name', 'Embarked')
test = test[ , !(names(test) %in% drops)]



data.frame(sapply(train, class))



####################TESTING MODEL################
library(boot)


glm_train = glm(Survived~Pclass+Sex+Age+SibSp+Parch+Fare,data=train)
k_fold_cv_error = cv.glm(train, glm_train, K = 5)

#want lowest MSE (delta) value
#first value: standard k means estimate, second:bias corrected
k_fold_cv_error$delta

glm_cv_rmse = sqrt(k_fold_cv_error$delta)[1]
glm_cv_rmse #off by .38

#callable values
names(glm_train)
glm_train$coefficients

#Random Forest
library('randomForest')

names(train)

set.seed(1738)
train_y = as.factor(train[,'Survived'])
train_x = train[, names(train) !=list('PassengerId','Survived', 'SibSp','Parch')]
head(train_y)
head(train_x)

rf_model = randomForest(train_x, y = train_y, ntree= 1000, importance = TRUE)

names(rf_model)
rf_model$confusion
rf_model$predicted
