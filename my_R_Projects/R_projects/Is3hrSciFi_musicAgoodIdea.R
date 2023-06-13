movies <- read.csv(
  file = 'Movies.csv',
  quote = '\"')
)

head(movies)

genres<- read.csv(
  file = 'datasets/Genres.csv',
  quote = '\"'
)

head(genres)

#convert rating to a factor
movies$Rating <- as.factor(movies$Rating)

head(movies)

#univariate analysis qualitative(categorical) varaible
table(movies$Rating)
table(genres$Genre)

#univariate analysis on quanitative(numerical) variable
mean(movies$Runtime)
median(movies$Runtime)
which.max(table(movies$Runtime))
#analyze spread
min(movies$Runtime)
max(movies$Runtime)
range(movies$Runtime)
diff(range(movies$Runtime))
quantile(movies$Runtime)
quantile(movies$Runtime, .25)
quantile(movies$Runtime, .90)
#Interquartile range 3rdquartile(113) - first quartile (93)
#means interfifty percent of the values
IQR(movies$Runtime)
var(movies$Runtime)
sd(movies$Runtime)
#one standard deviation is essentially 17 min
#smaller the number the smaller the spread

#analyze shape of quantitative(numerical) variable
install.packages('moments')
library(moments)
#need to get functions
skewness(movies$Runtime)
#skewness of 0 is perfectly symetrical
#since 1.00 means positive so tail skew or skew to right
kurtosis(movies$Runtime)
#tells how sharp or flat peak of distribution is
#value greater, less or equal to 3
#value of 3 is a normal distribution
#5.9 means steeper than normal dist
plot(density(movies$Runtime))
#summary and spread
summary((movies$Runtime))

################Bivariate for 2 qualitiative(categorical) variables
table(genres$Genre, genres$Rating)

#bivariate analysis 2 quantitative (numerical) variables
#covariance
cov(movies$Runtime, movies$Box.Office)
cov(movies$Critic.Score, movies$Box.Office)
#positive values mean vary in a positive way
#large values of first variable correspond to large
#values of second value
#negative values mean they vary inversely to eachother

#in general as critic score increases the box office increaseses
#cannot compare these two covariance values
#to determine whether the runtime or critic score
#correlate more strongly

#we need the correlation coefficient to compare in apples to apples way
cor(movies$Runtime, movies$Box.Office)
cor(movies$Critic.Score, movies$Box.Office)
#0 is no correlation, 1 total positive -1 total negative
#=movie runtime more strongly correlates to Box Office revenue
#both are small so neither suitable for predictor of box office revenue

#this value ONLY tells if two variables correlate 
#nothing about influence of one on other

#bivariate statistics for one qualitative(categorical) and one quantitative(numerical) data
tapply(movies$Box.Office, movies$Rating, mean)
#tapply is like sapply executes function off collection of values
#tapply allows groupign by a factor like movie rating or genre before applying function
#so to see average revenue ax each movie rating category we use it

#in this we are applying the mean function to the 
#boxOffice category and grouping by rating category

#Joe's decision to make R rated movie might not be best

tapply(genres$Box.Office, genres$Genre, mean)

summary(movies)
#movie titles and ratings list frequency tables
#all else are quantitative tables

#pg rated, fantasy, action film safer than 
#3 hour sci-fi musical 