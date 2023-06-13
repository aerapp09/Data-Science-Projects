library(tidyverse)
library(reshape2)
housing = read.csv('datasets/housing.csv')
#see if imported correctly
head(housing)
#use summary to check a few things
summary(housing)
#1Na's in total_bedrooms need to be addressed
#2will split Ocean_proxmity even tho most ML 
#algroithms can handle more than one catergoricals in a single column
#3 will turn total_bedrooms and total_rooms
#into mean_total_bedroom/room this is better depiction of a given group?
par(mfrow=c(2,5))
colnames(housing)

ggplot(data=melt(housing),mapping=aes(x=value)) +
  geom_histogram(bins=30) + facet_wrap(~variable,scales='free_x')
#Observations:1.Old age homes are here,
#2Cap on median home value bc it caps at 500k
#unusual for SF in 1990s. 3. Should scale data
#for non-tree methods as variables are all over
#the place in range.

#################DATA CLEANING#######
#Missing values
housing$total_bedrooms[is.na(housing$total_bedrooms)] = median(housing$total_bedrooms, na.rm=TRUE)
#Exchange 'total bedrooms' (useless info) make them means 
housing$mean_bedrooms= housing$total_bedrooms/housing$households
housing$mean_rooms=housing$total_rooms/housing$households

drops = c('total_bedrooms', 'total_rooms')
###DROPPING this how it's done
housing=housing[ , !(names(housing) %in% drops)]
head(housing)

############TURN CATEGORICAL INTO BOOleans
#1.Get list categories of 'ocean_prox'
#2.New empty df of all 0s, ea category is its own column
#3. use for loop populate appropriate columns of df
#4. drop original column
categories = unique(housing$ocean_proximity)
#split categories
cat_housing = data.frame(ocean_proximity= housing$ocean_proximity)
#'ocean_proxmity' tag will appear as a column name instead of housing.ocean_proxmity
for(cat in categories){
  cat_housing[,cat] = rep(0, times= nrow(cat_housing))
}
#sets up df like a factor, sets corresponding 
#column/row index values to 1
for(i in 1:length(cat_housing$ocean_proximity)){
  cat = as.character(cat_housing$ocean_proximity[i])
  cat_housing[,cat][i] = 1
}
head(cat_housing)

cat_columns = names(cat_housing)
#list of column names discludes 'ocean_prox'
keep_columns = cat_columns[cat_columns != 'ocean_proximity']
#will drop column that is not in keep_columns 
#in this case ocean_proximity 
cat_housing = select(cat_housing, one_of(keep_columns))
keep_columns

tail(cat_housing)

###########SCALE NUMERICAL VARIABLES#####
#all values except desired prediction value 'median_house_value'
colnames(housing)
#create df discluding ocean_prox and med_house
drops = c('ocean_proximity','median_house_value')
housing_num = housing[ , !(names(housing) %in% drops)]
head(housing_num)
#scaling numerical values
scaled_housing_num = scale(housing_num)
head(scaled_housing_num)

#######Merge altered numerical/catergorical dfs
cleaned_housing = cbind(cat_housing, scaled_housing_num, median_house_value= housing$median_house_value)
head(cleaned_housing)

############Create TEST set ############

set.seed(1738) #set random seed so same sample
#can be reproduced again

#create a sample of random numbers the length of 80% of the number of rows we have:
sample = sample.int(n = nrow(cleaned_housing), size = floor(.8*nrow(cleaned_housing)), replace = F)
train = cleaned_housing[sample, ]#just the samples
test = cleaned_housing[-sample, ]#everything but the samples

#sanity check
#has the columns we want?
head(train)
#length of train and test equal to df they were split from? 
nrow(train) + nrow(test) == nrow(cleaned_housing)


############Testing some Predictive Models

#start with 3 of available predictors
#median income, total rooms, and population
#can use the training data as cross validation
#to test itself k = 5 means training data 
#split in 5 equal poritions one of which will
#test the model

library('boot')

?cv.glm #cross valid for generalized lm
#left side of tilda used for response/dependent variable that we are trying to predict, the right side is 
glm_house = glm(median_house_value~median_income+mean_rooms+population, data=cleaned_housing)
                        #data, glmfit, K value
k_fold_cv_error = cv.glm(cleaned_housing, glm_house, K = 5)
k_fold_cv_error$delta

#first is raw cross-validation estimate of prediction error
#second adjusted cross-validation estimate
glm_cv_rmse = sqrt(k_fold_cv_error$delta)[1]
glm_cv_rmse #off by $83,000

names(glm_house) #callable parts of model

glm_house$coefficients
#since inputs scaled we see median_income
#has biggest effect on housing price

##########Random Forest Model
library('randomForest')
?randomForest
names(train)

#splitting train dependent and ind variables
set.seed(1738)
train_y = train[,'median_house_value']
train_x = train[, names(train) !='median_house_value']
head(train_y)
head(train_x)

#two different r formats:
#rf_model = randomForest(median_house_value~. , data= train, ntree=500, importance = TRUE)
rf_model = randomForest(train_x, y = train_y, ntree= 500, importance = TRUE)

names(rf_model)
