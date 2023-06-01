cars <- read.csv('Cars.csv')

library(ggplot2)

#create frequency bar chart
ggplot(
  data=cars,
  aes(x=Transmission)) +
  geom_bar() +
  ggtitle('Count of Cars by Transmission Type') 
  xlab('Transmission Type') +
  ylab('Count of Cars')

