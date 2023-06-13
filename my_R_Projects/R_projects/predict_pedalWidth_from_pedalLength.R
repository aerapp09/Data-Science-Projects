#other types of data analysis
#descriptive, exploratory, inferential, predictive, causal, mechanistic
#load iris data
data(iris)
head(iris)
#find unique species
unique(iris$Species)
table(iris$Species)
#scatter plot matrix
plot(iris[1:4])

plot(
  x=iris$Petal.Length,
  y=iris$Petal.Width)
#linear regression model
x<- iris$Petal.Length
y<-iris$Petal.Width
model<- lm(y ~ x)
#lm on plot
lines(
  x = iris$Petal.Length,
  y= model$fitted,
  col = 'red',
  lwd = 3
)
#correlation coefficient
cor(
  x=iris$Petal.Length,
  y=iris$Petal.Width
)
#summary
summary(model)

#predict new unknown values 
predict(
  object = model,
  newdata = data.frame(x = c(2,5,7,20))
)