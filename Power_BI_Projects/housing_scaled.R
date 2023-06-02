housing<- read.csv('datasets/housing.csv')

summary(housing$households)
plot(housing$households, housing$population)
pop.house<- data.frame(housing$population, housing$households)
colnames(pop.house)[1:2] = c('population', 'households')

pop.house['households.scaled']<- pop.house$households/max(pop.house$households)
pop.house['population.scaled']<- pop.house$population/max(pop.house$population)

write.csv(pop.house, 'C:/Users/aerap/OneDrive/Documents/GitHub/Data-Science-Projects/Power_BI_Projects/datasets/pophouse.csv', row.names= FALSE)

