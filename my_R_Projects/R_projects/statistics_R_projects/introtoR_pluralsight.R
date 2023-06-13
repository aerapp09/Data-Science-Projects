 x <- 'hello world!'
print(x) 
x
l <- TRUE
i <- 123L
n <- 1.23
c <- 'Abc 123'
d <- as.Date('2001-01-03')

l
i
n
c
d

#creating a function
f <- function(x) {x + 1 }

#invoking a function
f(2)

#creating a vector
v <-c(1,2,3)
v

#creating a sequence
s <- 1: 5
s

#creatng a matrix
m <- matrix(
  data=1:6,
  nrow = 2,
  ncol = 3)
m

#creating an array
a <- array(
  data= 1:8,
  dim= c(2,2,2)
)
a

# creating a list
l <- list(TRUE, 123L, 2.34, 'abc')
l

#Creating a factor
categories <- c('Male', 'Female', 'Male', 'Male')
factor <- factor(categories)
factor
levels(factor)
unclass(factor)

#creating a data frame
df <- data.frame(
  Name = c('Cat', 'Dog', 'Cow', 'Pig'),
  HowMany = c(5,10,15,20),
  IsPet = c(TRUE, TRUE, FALSE, FALSE)
)
df

df[1,2]

#subsetting data frames
df[c(2,4), ]
df[2:4, ]
df[c(TRUE, FALSE, TRUE, FALSE),]
df[df$IsPet == TRUE, ]
df[df$HowMany > 10,]
df[df$Name %in% c('Cat', 'Cow'),]

1 -2 
c(1,2,3) + c(2,4,6)

m <- matrix(data = 1:6, nrow=2, ncol=3)
n <- matrix(1:6, 2, 3)
m ==n
identical(m, n)

install.packages('dplyr')

#loading packages
library('dplyr')

#viewing help
?data.frame
