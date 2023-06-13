library(tidyverse)
library(reshape2)
train<- read.csv('datasets/titanic/train.csv')
head(train)
summary(train)

#Change Sex to a factor so it can be processed by Random Forest
#Replace null values in Age with median
train$Sex<- as.factor(train$Sex)
train$Survived<- as.factor(train$Survived)
train$Pclass <- as.factor(train$Pclass)

train$Age[is.na(train$Age)] = median(train$Age, na.rm=TRUE)
summary(train)


#there is empty cells in 'Embarked' column
train$Embarked<- sub('^$', 'S', train$Embarked)

par(mar = c(1, 1, 1, 1))

gender <- table(
  train$Survived,
  train$Sex
)

barplot(
  height=gender,
  beside=TRUE,
  main= 'Survival Rate by Gender',
  xlab= 'Gender',
  ylab= 'Count of Passenger',
  legend = c('No', 'Yes'),
  args.legend =list(
    x= 'topleft',
    title='Survived?'))

barplot(
  height=gender,
  main= 'Survival Rate by Gender',
  xlab= 'Gender',
  ylab= 'Count of Passenger',
  legend = c('No', 'Yes'),
  args.legend =list(
    x= 'topleft',
    title='Survived?'))

ggplot(
  data=train,
  aes(x = Sex, fill= Survived)) +
  geom_bar(position = 'dodge') +
  ggtitle('Survivability by Gender')
scale_fill_discrete(label = c('No','Yes'))

ggplot(
  data=train,
  aes(x = Pclass, fill= Survived)) +
  geom_bar(position = 'dodge') +
  ggtitle('Survivability by Class')
scale_fill_discrete(label = c('No','Yes'))


#create unique table for categorical data 'Embarked"
#so ML can use data once is converted to numerical
unique(train$Embarked)
table(train$Embarked)
table(is.na(train$Embarked))
categories = unique(train$Embarked)
categories
cat_train = data.frame(Embarked= train$Embarked)
#replicates '0' in all rows. Embarked S,C,Q become column names
for(cat in categories){
  cat_train[,cat] = rep(0, times= nrow(cat_train))
}
#creates loop from 1 to length cat_train
#in each iteration a variable 'cat' is created
#it is replaced with the value in index 1 of column 'Embarked'
#converts to characted. This value is placed in the column
#value of cat_train at the index provided 'R','Q','S'. Then inputs
#the value in this  row to 1. 
for(i in 1:length(cat_train$Embarked)){
  cat = as.character(cat_train$Embarked[i])
  cat_train[,cat][i] = 1
}

#get rid of Embarked column
cat_columns = names(cat_train)
keep_columns = cat_columns[cat_columns != 'Embarked']

cat_train = select(cat_train, one_of(keep_columns))

drops = list('Ticket', 'Cabin', 'Name', 'Embarked')
train = train[ 3, !(names(train) %in% drops)]
#merge cleaned data
cleaned_train = cbind(train, cat_train)

#No need to create test set, Kaggle already did that for us
train = cleaned_train
#make sure we have the number of rows we expect
nrow(train)

train$Survived<- as.numeric(train$Survived)
train$Pclass <- as.numeric(train$Pclass)
####################TESTING MODEL################
library(boot)
names(train) == names(cleaned_train)

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
