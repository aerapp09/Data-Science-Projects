#creating statistical models

#load data
data(iris)
head(iris)

#create scatterplot
plot(
  x=iris$Petal.Length,
  y=iris$Petal.Width,
  main = 'Iris Petal Length vs. Width',
  xlab='Petal Length (cm)',
  ylab = 'Petal width (cm)'
)

#create a linear regression model
model <- lm(
  formula = Petal.Width ~ Petal.Length,
  data= iris)

#summarize the model
summary(model)

#Draw a regression line on plot
lines(
  x=iris$Petal.Length,
  y=model$fitted,
  col='red',
  lwd=3)

#get correlation coeficient
cor(
  x=iris$Petal.Length,
  y=iris$Petal.Width)

#predict new values from model
predict(
  object = model,
  newdata = data.frame(
    Petal.Length = c(2,5,7)
    )
)




