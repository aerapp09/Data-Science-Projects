#machine learning can: classify, regression(predict)
#clustering like data, detect anomoly
#types: supervised, unsupervised, reinforcement
#types of algorithms: decision tree classifier, naive bayesclassifier
#linear regression, support vector machine, k-means cluster 

#what is the species of iris flower
#what is the prediction accuracy

#load data
data(iris)

#set a seed to make randomness reproducable
# what this means is it will produce the same
#sequence of numbers on any computers used
#the number used is IRRELEVANT it just has to be the same on each computer
set.seed(42)

#randomly sample 100 0f 150 row indexes
#splitting in train and test data set
#x = 1: 150 will represent rows of columns in iris dataset
#setting size to 100 because we want set of 100 indexes because we want 100 rows 
#this leaves 50 rows for test dataset
indexes <- sample(
  x= 1:150,
  size = 100)


#inspect random indexes
print(indexes)

#prints 100 randomly selected row indexes between 1 and 150
#create training set from indexes
#leave column index blank because we want all columns
train<- iris[indexes, ]

#create test dataset w remaining indexes
#(-) sign tells it to read all indexes except those in the row indexes variable
test<-iris[-indexes,]

#load decision tree package
library(tree)

#Train a decision tree model
#Species~. sets species as a function of all other variables in the data set
#get same result w Species ~ Petal.length + Petal.Width + Sepal.length + Sepal.Width
model <- tree(
  formula = Species ~ Petal.Length + Petal.Width,
  data=train)

#inspect the model
summary(model)

#only three variables were used because there create the best decision tree given the data in the algorithm
plot(model)
text(model)

#load color brewer library
library(RColorBrewer)

#create a color palette
palette <- brewer.pal(3, 'Set2')

#create a scatterplot colored by species
plot(
  x=iris$Petal.Length,
  y=iris$Petal.Width,
  pch = 19,
  col = palette[as.numeric(iris$Species)],
  main= 'Iris Petal Length vs. Width',
  xlab = 'Petal Length (cm)',
  ylab= 'Petal Width (cm)'
)

#Plot decision boundaries
partition.tree(
  tree = model,
  label = 'Species',
  add = TRUE)

#Predict with the model
predictions <-predict(
  object = model,
  newdata = test,
  type = 'class'
)

#create a confusion matrix 
table(
  x = predictions,
  y = test$Species)

#Load the caret package
library(caret)

#Evaluate the prediction results
confusionMatrix(
  data=predictions,
  reference = test$Species)

#set wd
setwd('C:/Learning_projects')

#save the tree model
save(model, file ='Tree.RData')

#save the training data
save(train, file = "Train.RData")
