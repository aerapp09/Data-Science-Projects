#when quanititative univariate analysis:
#single numerical data variable
#think: location, spread, shape
#ex: dotplot, boxplot, histogram(binning)
#ex real: Run time, pizzas sold ect...

#data visualization
movies<- read.csv('Movies.csv', quote = "\"")
genres<- read.csv('datasets/Genres.csv', quote = "\"")

head(movies)

#convert rating to a factor
movies$Rating <- as.factor(movies$Rating)

#Qualitative (categorical) bivariate analysis
#interested in the intersection(frequency) of two categories
# ex: spine plot, mosaic plot

#Quantitative Bivariate Analysis
#ex scatterplot(frequency), line graph(time)

#Quantitative and Qualitative 
#bar charts, multiple box plots

######Univariate visualization for a 
####qualitative variable

#Create a bar graph of rating observations
plot(movies$Rating)

pie(table(movies$Rating))

#create a dot plot of runtime
plot(
  x=movies$Runtime,
  #this y adds a '0' for all x values 
  y=rep(0, nrow(movies)),
  ylab= "",
  yaxt = "n"
)

###Univariate vis of quantitative(numerical) variable
#boxplot of runtime
boxplot(
  x=movies$Runtime,
  xlab= 'Runtime(minutes',
  horizontal = TRUE
)

#Create a histogram of runtime
hist(movies$Runtime)

#course-grain histogram
hist(
  x=movies$Runtime,
  breaks=30)

#density plot
plot(density(movies$Runtime))

#add points to density plot
points(
  x=movies$Runtime,
  y= rep(-0.0005, nrow(movies))
)

###########Bivariate visualization for 
######Two qualitative (categorical) values

#spineplot genre rating
?spineplot
spineplot(table(
  x = genres$Genre,
  y= genres$Rating))

#mosaic plot
?mosaicplot
mosaicplot(
  x= table(
    genres$Genre,
    genres$Rating)

#####Bivariate visualization for two
#quanititive (numeric) variables

#scatterplot of runtime and box office
plot(
  x=movies$Runtime,
  y=movies$Box.Office)

#scatter critic score and box office
plot(
  x = movies$Critic.Score,
  y=movies$Box.Office)

#line graph count of movies by year
#this makes sense because a variable has a time scale
plot(
  x=table(movies$Year),
  type='l')

########Bivariate vis of both a qualitative
#and quantitative variables
#average box office by rating
barplot(tapply(movies$Box.Office, movies$Rating, mean))
#frequency
barplot(table(movies$Rating))
#average box office by genre
barplot(
  height=tapply(genres$Box.Office, genres$Genre, mean),
  las=3)
#bivariate box plot by rating
plot(
  x=movies$Rating,
  y=movies$Box.Office)
#summarize entire table
plot(movies)
#movie frequency by rating
plot(movies$Rating)
#clean it up
plot(
  x=movies$Rating,
  main = 'Count of Movies by Rating',
  xlab = 'Rating Category',
  ylab = 'Count of Movies',
  col = '#b3cde3'
)

#how to find help
?plot
?as.factor
