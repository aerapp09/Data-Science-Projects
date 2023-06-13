#big data= something in terrabytes, petabytes
#not enough space on a computer. Need a server
#load ff package
library(ff)
#read csv file as ff data frame
irisff <- read.table.ffdf(
  file = "Iris.csv",
  FUN = "read.csv")

#inspect the class
class(irisff)

#inspect column names
names(irisff)

#load biglm package
library(biglm)

#biglm uses less memory to build linear model
#than normal lm function
#create a linear regression model
model <- biglm(
  formula = Petal.Width ~ Petal.Length,
  data = irisff
)

#model summary
summary(model)

#scatterplot
#have to add [] because these are just 
#reference names to data in the csv files not just the vector data themselves 
plot(
  x=irisff$Petal.Length[],
  y=irisff$Petal.Width[],
  main= 'Iris Petal Length vs Width',
  xlab= 'Petal Length (cm)',
  ylab = 'Petal Width (cm)'
)

#get y-intercept from model
b <- summary(model)$mat[1,1]

#Get slope from model
m<- summary(model)$mat[2,1]

#draw a regression line on plot
#lwd = line width
lines(
  x = irisff$Petal.Length[],
  y = m * irisff$Petal.Length[] + b,
  col = 'red',
  lwd = 3)

# Predict new values with the model
#biglm requires us to input a column with 0s 
#for it to output data into. Just a little quirk of biglm
predict(
  object = model,
  newdata = data.frame(
    Petal.Length = c(2, 5, 7),
    Petal.Width = c(0, 0, 0)
  )
)

