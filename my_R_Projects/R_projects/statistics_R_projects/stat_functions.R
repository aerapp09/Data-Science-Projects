cars <- read.csv('Cars.csv')
head(cars)
#frequency table
table(cars$Transmission)
#min value
min(cars$Fuel.Economy)
#get max value
max(cars$Fuel.Economy)
mean(cars$Fuel.Economy)
median(cars$Fuel.Economy)
quantile(cars$Fuel.Economy)
sd(cars$Fuel.Economy)
sum(cars$Fuel.Economy)

#get correlation coefficient
cor(
  x=cars$Cylinders,
  y=cars$Fuel.Economy)
)
#get most info together
summary(cars)
