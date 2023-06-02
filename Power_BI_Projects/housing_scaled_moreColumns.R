########POWER BI PROJECT##############

#Goal: create scaled dashboard visualizations 
#in powerBi by utilizing R and importing into BI

#load data

housing<- read.csv('datasets/housing.csv')

#get view of data
summary(housing$households)

#housing bedrooms has null values
table(is.na(housing$total_bedrooms))

#covert null values to median
housing$total_bedrooms[is.na(housing$total_bedrooms)] = median(housing$total_bedrooms, na.rm=TRUE)

#create new data frame
pop.house<- data.frame(matrix(ncol= 4, nrow=0)

#way to rename data frame
colnames(pop.house)[1:4] = c('population', 'households', 'total_rooms','total_bedrooms')

#adding scaled columns to data frame
pop.house['households.scaled']<- pop.house$households/max(pop.house$households)
pop.house['population.scaled']<- pop.house$population/max(pop.house$population)
pop.house['total_rooms.scaled']<- pop.house$total_rooms/max(pop.house$total_rooms)
pop.house['total_bedrooms.scaled']<- pop.house$total_bedrooms/max(pop.house$total_bedrooms)

#drop first four rows 
pop.house<- pop.house[,-1:-4]


write.csv(pop.house, 'C:/Users/aerap/OneDrive/Documents/GitHub/Data-Science-Projects/Power_BI_Projects/datasets/pophouse2.csv', row.names= FALSE)

