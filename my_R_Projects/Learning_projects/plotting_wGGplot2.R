cars <- read.csv('Cars.csv')

library(ggplot2)

#create frequency bar chart
ggplot(
  data=cars,
  aes(x=Transmission)) +
  geom_bar() +
  ggtitle('Count of Cars by Transmission Type')+ 
  xlab('Transmission Type') +
  ylab('Count of Cars')

#create a histogram
ggplot(
  data=cars,
  aes(x=Fuel.Economy))+
  geom_histogram(
    bins=10) +
  ggtitle('Distribution of Fuel Economy') +
  xlab('Fuel Economy (mpg)') +
  ylab('Count of Cars')

#density plot
ggplot(
  data = cars,
  aes(x = Fuel.Economy)) +
  geom_density() +
  ggtitle('Distribution of Fuel Economy')+
  xlab('Fuel Economy (mpg)') +
  ylab('Density')

#crerate a scatterplot
ggplot(
  data=cars,
  aes(
    x = Cylinders,
    y = Fuel.Economy)) +
  geom_point() + 
  ggtitle('Fuel Economy by Cylinders') +
  xlab('Number of Cylinders') +
  ylab('Fuel Economy (mpg)')
  )
)