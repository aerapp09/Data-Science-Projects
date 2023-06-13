df<- data.frame(
  Name = as.factor(c('a', 'b', 'c')),
  Value= c(1, 2, 3)
)
print(df)
plot(df )
plot(df$Name, df$Value)

plot(
  x=df$Name,
  y=df$Value)
)
#barchart
barplot(
  names=df$Name,
  height = df$Value,
  col='skyblue',
  main = 'Hello World',
  xlab = 'Name',
  ylab = 'Value')
)
install.packages('lattice')
library(lattice)
        
dotplot(
  x= Value ~ Name,
  data = df)
)

dotplot(
  x= Value~ Name,
  data= df,
  main = "Hello World",
  xlab = 'Name',
  ylab = 'Value')
)

barchart(
  x= Value~ Name,
  data = df,
  col = 'magenta',
  main= 'Finny be good',
  xlab = 'Health',
  ylab = 'Value')
)
library(ggplot2)
ggplot(
  data = df,
  aes(
    x=Name,
    y=Value)) +
  geom_point()
)

ggplot(
  data = df,
  aes(
    x=Name,
    y=Value)) +
  geom_point() +
  ggtitle('Hello') +
  xlab('Name') +
  ylab('Value')

#barchart
ggplot(
  data = df,
  aes(
    x=Name,
    y=Value)) +
  geom_bar(
    stat = 'identity',
    fill = 'red') +
  ggtitle('Hello') +
  xlab('Name') +
  ylab('Value')



###Qual Uni Analysis
movies <- read.csv('datasets/Movies3.csv')
head(movies)

############## Uni visual for qual variable
#Mean BarChart
plot(
  x=as.factor(movies$Rating),
  main= 'Count of Movies by Rating',
  xlab= 'Rating',
  ylab = 'Count of Movies')

#horizontal bar chart
plot(
  x=as.factor(movies$Rating),
  horiz = TRUE,
  main = 'Count of Movies by Rating',
  xlab = 'Count of Movies',
  ylab = 'Rating')

#create a Cleveland dot plot
dotchart(
  x = (table(movies$Rating)),
  pch = 16,
  main = 'Count of Movies by Rating',
  xlab = 'Count of Movies',
  ylab = 'Rating')

#Pie chart of ratings
pie(
  x= table(movies$Rating),
  main = 'Count of Movies by Rating')


#pie of awards
pie(
  x = table(movies$Awards),
  clockwise = TRUE,
  main = '% movies won awards'
)
################QUANTIATIVE UNIVARIATE ANALYSIS
#dotplot runtime
plot(
  x=movies$Runtime,
  y=rep(0, nrow(movies)),
  main='Dist of movie Runtimes',
  xlab = 'Runtime(minutes)',
  ylab = '',
  yaxt='n'
)

#dotplot make it "Transparent" 
plot(
  x=movies$Runtime,
  y = rep(0, nrow(movies)),
  main='Dist of Movie Runtimes',
  xlab = 'Runtime (min)',
  ylab = '',
  yaxt = 'n',
  pch = 16,
  col = rgb(0,0,0,0.1)
)


#jitter dot plot
plot(
  x=movies$Runtime,
  y=jitter(rep(0, nrow(movies))),
  main='Dist of movie Runtimes',
  xlab = 'Runtime(minutes)',
  ylab = '',
  yaxt='n'
)

hist(
  x=movies$Runtime,
  main='Dist of movie Runtimes',
  xlab='Runtime(min)'
)

hist(
  x=movies$Runtime,
  breaks= 10,
  main='Dist of movie Runtimes',
  xlab='Runtime(min)'
)

hist(
  x=movies$Runtime,
  breaks= 30,
  main='Dist of movie Runtimes',
  xlab='Runtime(min)'
)

#density plot

plot(
  x=density(movies$Runtime),
  main='Dist of movie Runtimes',
  xlab='Runtime(min)'
  )

###small multiples of all four Quant 
par(mfrow = c(4,1))

plot(
  x=movies$Runtime,
  y=jitter(rep(0, nrow(movies))),
  xlim = c(0,250),
  main='Dist of movie Runtimes',
  xlab='Runtime(min)',
  ylab= '',
  yaxt = 'n',
  pch = 16,
  col = rgb(0,0,0,0.1))


boxplot(
  x=movies$Runtime,
  xlim = c(0,250),
  horizontal=TRUE)

hist(
  x=movies$Runtime,
  xlim = c(0,250),
  main='',
  xlab='',
  ylab='',
  yaxt ='n'
)

plot(
  x=density(movies$Runtime),
  xlim = c(0,250),
  xlab = 'Runtime(min',
  ylab = '',
  yaxt = 'n')

#Reset multi-row display
par(mfrow = c(1,1))




#load lattice
library(lattice)

class(movies$Rating)

#convert class charcter to table, lists frequency
table<- table(movies$Rating)
table
ratings<- as.data.frame(table)
names(ratings)[1]

#renaming(column name)
names(ratings)[1] <- 'Rating'
names(ratings)[2]<- 'Count'

#frequency bar chart
barchart(
  x= Count~Rating,
  data = ratings,
  main ='Count of Movies by Rating',
  xlab='Rating')

#compared to....
plot(
  x=as.factor(movies$Rating),
  main= 'Count of Movies by Rating',
  xlab= 'Rating',
  ylab = 'Count of Movies')

#horizontal bar chart
plot(
  x=as.factor(movies$Rating),
  horiz = TRUE,
  main = 'Count of Movies by Rating',
  xlab = 'Count of Movies',
  ylab = 'Rating')

#other version...
barchart(
  x= Rating~ Count,
  data = ratings,
  main = 'Count of movies by rating',
  ylab='Rating')


#dotplot (Rating as a function of Count)
dotplot(
  x=Rating~Count,
  data= ratings,
  main = 'Count of Movies by Rating',
  ylab = 'Rating')

#compared to....
#r has an easier time with 'x' as a dataframe as above
dotchart(
  x = (table(movies$Rating)),
  pch = 16,
  main = 'Count of Movies by Rating',
  xlab = 'Count of Movies',
  ylab = 'Rating')

#part-of-whole frequency bar chart
dev.off()
library(lattice)
#this doesn't work
histogram(
  x= ~Rating,
  data= movies,
  main = 'Percent of Movies by rating')
#this works
histogram(
  x= as.factor(movies$Rating),
  data=movies)


#ggplot
library(ggplot2)

## Count of movies by rating
ggplot(
  data=movies,
  aes(x=Rating)) +
  geom_bar() +
  ggtitle('count of movies by rating')
#rotate
ggplot(
  data=movies,
  aes(x=Rating)) +
  geom_bar() +
  coord_flip() + 
  ggtitle('count of movies by rating')


ggplot(
  data=movies,
  aes(x=Rating)) +
  geom_point(stat = 'count') +
  coord_flip() + 
  ggtitle('count of movies by rating')

#pie chart of Ratings
ggplot(
  data=movies,
  aes(x='', fill=Rating)) +
  geom_bar() +
  coord_polar(theta='y') + 
  ggtitle('count of movies by rating')

#pie chart of awards
ggplot(
  data=movies,
  aes(x='', fill=Awards))+
  geom_bar() +
  coord_polar(theta='y') +
  ggtitle('proportion movies won awards') +
  ylab('')


###########lattice cont
stripplot(
  x=~Runtime,
  data=movies,
  main= 'distribution of movie runtimes',
  xlab='runtime(min)'
)

#make line jitter

stripplot(
  x=~Runtime,
  data=movies,
  jitter= TRUE,
  amount= .5,
  main= 'distribution of movie runtimes',
  xlab='runtime(min)'
)

#boxplot w lattice
bwplot(
  x=~Runtime,
  data=movies,
  main='distribution of movie runtime',
  xlab='runtime(min)'
)

histogram(
  x=~Runtime,
  data=movies,
  main='distribution of movie runtime',
  xlab='runtime(min)'
)

densityplot(
  x=~Runtime,
  data=movies,
  main='distribution of movie runtime',
  xlab='runtime(min)'
)

#create small multiples of all four
dot<-dotplot(
  x=~Runtime,
  data=movies,
  main='distribution of movie runtime',
  xlab=''
)
print(
  x=dot,
  position=c(0, 0.75,1,1),
  more=TRUE)

box<-bwplot(
  x=~Runtime,
  data=movies,
  main='distribution of movie runtime',
  xlab=''
)
print(
  x=box,
  position=c(0, 0.75,1,1),
  more=TRUE)
)
hist<-histogram(
  x=~Runtime,
  data=movies,
  main='distribution of movie runtime',
  xlab=''
)
print(
  x=hist,
  position=c(0, 0.75,1,1),
  more=TRUE)
)
density<-densityplot(
  x=~Runtime,
  data=movies,
  main='distribution of movie runtime',
  xlab=''
)
print(
  x=density,
  position=c(0, 0.75,1,1),
  more=TRUE)
)
