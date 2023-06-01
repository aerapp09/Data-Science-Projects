
cars <-read.table(
  file = 'cars.txt',
  header=TRUE,
  quote = "\""
)
head(cars)

library(dplyr)

#subset of column select
temp<- select(
  .data= cars,
  Transmission,
  Cylinders,
  Fuel.Economy
)

head(temp)


#filter subset rows
temp<- filter(
  .data = temp,
  Transmission =='Automatic'
)
head(temp)

#compute new column
temp<-mutate(
  .data=temp,
  Consumption= Fuel.Economy*0.425
)

head(temp)

#group by a column
temp<- group_by(
  .data=temp,
  Cylinders
)
head(temp)

#aggregate based on groups
temp<-summarize(
  .data=temp,
  Avg.Consumption = mean(Consumption)
)
head(temp)

#arrange rows in desc order
temp<- arrange(
  .data = temp,
  desc(Avg.Consumption)
)
head(temp)

#convert to data frame
efficiency <- as.data.frame(temp)

print(efficiency)

#%>%creates more readable chain of commands
#chain methods together
efficiency <-cars %>%
  select(Fuel.Economy, Cylinders, Transmission) %>%
  filter(Transmission =='Automatic') %>%
  mutate(Consumption = Fuel.Economy * 0.425) %>%
  group_by(Cylinders) %>%
  summarize(Avg.Consumption = mean(Consumption)) %>%
  arrange(desc(Avg.Consumption))%>%
  as.data.frame()
  
print(efficiency)

#this all does what we previously
#did in one command

#save results
write.csv(
  x = efficiency,
  file = 'Fuel Efficiency.csv',
  row.names = FALSE
)