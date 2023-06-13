
#Bivariate visualization of both Qualitative
#and quantitative variable

#Think Averages 

movies<- read.csv('datasets/movies3.csv')

#create scatterplot of average 2 variables
average <- tapply(
  movies$Box.Office,
  movies$Rating,
  mean)
class(average)
head(average)

barplot(
  height = average,
  main = 'Average of Box Office Revenue by Rating',
  xlab= 'Rating',
  ylab = 'Average Box Office ($M)')


#bivariate box plot
plot(
  x = as.factor(movies$Rating),
  y = movies $Box.Office,
  main = 'Box Office Revenue by Rating',
  xlab= 'Rating',
  ylab = 'Box Office ($M)')

#notched box plot
plot(
  x = as.factor(movies$Rating),
  y = movies $Box.Office,
  notch = TRUE,
  main = 'Box Office Revenue by Rating',
  xlab= 'Rating',
  ylab = 'Box Office ($M)')


########dplyr############
library(dplyr)

#create table of average box office by rating
average<- movies %>%
  select(Rating, Box.Office) %>%
  group_by(Rating) %>%
  summarize(Box.Office = mean(Box.Office)) %>%
  as.data.frame()

average

#bivariate bar chart
barchart(
  x=  Box.office ~ Rating,
  data = movies,
  panel = panel.violin,
  main = 'Box Office Revenue by Rating',
  xlab= 'Rating',
  ylab = 'Box Office ($M)')
  
#############ggplot###############

#bar chart
ggplot(
  data = average,
  aes(x = Rating, y = Box.Office)) +
  geom_bar(stat = 'identity') +
  ggtitle('Box Office Revenue by Rating') +
  xlab('Rating') +
  ylab('Box Office ($M)')

#bivariate boxplot
ggplot(
  data = movies,
  aes(x = Rating, y = Box.Office)) +
  geom_boxplot() +
  ggtitle('Box Office Revenue by Rating') +
  xlab('Rating') +
  ylab('Box Office ($M)')

#create notched plot
ggplot(
  data = movies,
  aes(x = Rating, y = Box.Office)) +
  geom_boxplot(notch = TRUE) +
  ggtitle('Box Office Revenue by Rating') +
  xlab('Rating') +
  ylab('Box Office ($M)')

#violin plot
ggplot(
  data = movies,
  aes(x = Rating, y = Box.Office)) +
  geom_violin() +
  ggtitle('Box Office Revenue by Rating') +
  xlab('Rating') +
  ylab('Box Office ($M)')
