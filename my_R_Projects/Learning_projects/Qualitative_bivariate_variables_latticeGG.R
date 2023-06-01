
#Bivariate vis for 2 qualitative variables
movies <- read.csv('datasets/Movies3.csv')
head(movies)

awards <- table(
  movies$Awards,
  movies$Rating
)

barplot(
  height=awards,
  beside=TRUE,
  main= 'count of movies by ratings',
  xlab= 'Rating',
  ylab= 'count of movies',
  legend = c('No', 'Yes'),
  args.legend =list(
    x= 'topleft',
    title='Awards'))


barplot(
  height= awards,
  main= 'count of movies by ratings',
  xlab= 'Rating',
  ylab= 'count of movies',
  legend = c('No', 'Yes'),
  args.legend = list(
    x = 'topleft',
    title='Awards'))

#create a proportional frequency table
proportions<- apply(awards, 2, function(x) { x / sum(x)})

head(awards)
head(proportions)

barplot(
  height = proportions,
  main= 'proportion of movies by rating',
  xlab = 'Rating',
  ylab = 'Proportion of movies',
  legend= c('No', 'Yes'),
  args.legend = list(
    x='topleft',
    title = 'Awards'))

awards<- table(
  movies$Rating,
  movies$Awards)

colnames(awards) <- c('No', 'Yes')
print(awards)

spineplot(
  x = awards, 
  main = 'Proportion of movies by rating and award',
  xlab = 'Rating',
  ylab = 'awards')

mosaicplot(
  x = awards, 
  main = 'Proportion of movies by rating and award',
  xlab = 'Rating',
  ylab = 'awards')



barchart(
  x =awards,
  stack = FALSE,
  horizontal = FALSE,
  main= 'count of movies by ratings',
  xlab= 'Rating',
  ylab= 'count of movies',
  auto.key = list(
    x= 0.05,
    y=0.95,
    title= 'Awards',
    text = c('No', 'Yes')))

#stacked frequency barchart
barchart(
  x =awards,
  stack = TRUE,
  horizontal = FALSE,
  main= 'count of movies by ratings',
  xlab= 'Rating',
  ylab= 'count of movies',
  auto.key = list(
    x= 0.05,
    y=0.95,
    title= 'Awards',
    text = c('No', 'Yes')))


#proportional frequency table
matrix<- apply(awards, 1, function(x) {x /sum(x)})

proportions <- t(matrix)

head(awards)

head(proportions)

#100% stacked frequency bar chart
barchart(
  x=proportions,
  stack = TRUE,
  horizontal = FALSE, 
  main= 'count of movies by ratings',
  xlab= 'Rating',
  ylab= 'count of movies',
  auto.key = list(
    x= 0.70,
    y =1.05,
    title = 'Awards',
    columns = 1,
    text = c('No', 'Yes'),
    background = 'white'
  )
)
#no spine or mosaic in lattice

#grouped frequency barchart

ggplot(
  data=movies,
  aes(x = Rating, fill = Awards)) +
  geom_bar(position = 'dodge') +
  ggtitle('Count of Movies by Ratings and Awards')
  scale_fill_discrete(label = c('No','Yes'))
  
#stacked frequency barchart
ggplot(
  data=movies,
  aes(x = Rating, fill = Awards)) +
  geom_bar() +
  ggtitle('Count of Movies by Ratings and Awards')+
  scale_fill_discrete(label = c('No','Yes'))
  
#100 percent stacked barchart
ggplot(
  data = movies, 
  aes(x = Rating, fill = Awards)) +
  geom_bar(position = "fill") +
  ggtitle("Proportion of Movies by Rating and Awards") +
  ylab("Proportion of Movies") +
  scale_fill_discrete(labels = c("No", "Yes"))


