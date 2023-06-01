grade = 'C'
switch(grade, 
       'A' = print('Great'),
       'B' = print('Good'),
       'C' = print('Ok'),
       'D' = print('Bad'),
       'F' = print('Terrible'),
       print ('No Such Grade'))

str1= 'This is a string'
nchar(str1)
sprintf('Dog > Egg: %s', 'Dog' > 'Egg')
sprintf('Dog == Egg: %s', 'Dog' == 'Egg')
str2 = paste('Owl', 'Bear', sep = '')
str2

#comment

substr(x=str2, start=4, stop=7)

sub(pattern='Owl', replacement='Hawk', x=str2)
gsub(pattern ='Egg', replacement='Chicken',
     x='Egg Egg')
strVect = strsplit('A dog ran fast', ' ')
strVect

direction = c('Up', 'Left', 'Right', 'Down', 'Left')
factorDir = factor(direction)
is.factor(factorDir)

factorDir
levels(x=factorDir)

dow = c('Monday', 'Tuesday', 'Wednesday',
        'Thursday', 'Friday', 'Saturday',
        'Sunday')

wDays = c('Tuesday', 'Thursday', 'Monday')

wdFact = factor(x=wDays, levels = dow, ordered = T)
wdFact





custData = data.frame(name = c('Tom', 'Sally', 'Jared'),
                      age=c(43, 25, 64),
                      stringsAsFactors =F)

custData
custData[1,1]
custData[1,1:2]

custData[1:3,2]

dim(custData)

recordMark = data.frame(name = 'Mark', age=33)
custData = rbind(custData, recordMark)
custData

debt = c(0, 25.30, 43, 45.26)
custData = cbind(custData, debt)
custData

owesMoney = custData[custData$debt>0,]
owesMoney

num = 1
repeat{
  print(num)
  num=num+1
  if(num>5){
    break
  }
}

num=5
while(num >0){
  num=num-1
  if(num %% 2 ==0){
    next
  }
  print(num)
}

oneTo5 = 1:5
for(i in 1:5){
  print(i)
}

matrix1 = matrix(data=c(1,2,3,4))
matrix2 = matrix(data=c(1,2,3,4), nrow=2, ncol=2)
matrix2

matrix3 = matrix(data = c(1,2,3,4), nrow=2, ncol=2, byrow=T)
matrix3

dim(matrix3)

matrix3[1,2]

matrix3[1,]

matrix3[,2]

matrix4= rbind(1:3, 4:6, 7:9)
matrix4

matrix4[1:3]
matrix4[,1:3]
matrix4[-1]

matrix4[1,1] = 0
matrix4

matrix4 = rbind(1:3, 4:6, 7:9)
matrix4

matrix4[1,] = c(10,11,12)
matrix4

array1 = array(data = 1:8, dim=c(2,2,2))
array1

array1[1,2,2]

#functions
getSum = function(num1,num2) {
  return(num1 + num2)
}
sprintf('5+6 = %d', getSum(5,6))

getDifference = function(num1=1, num2=1){
  num1-num1
}
sprintf('5-6 = %d', getDifference(5,6))

makeList = function(theString){
  return(strsplit(theString, " "))
}

makeList('Random Words')

missFunc = function(x){
  if(missing(x)){
    return('Missing Argument')
  } else{
    return(x)
  }
}

getSumMore = function(...){
  numList= list(...)
  sum=0
  for(i in numList){
    sum= sum+i
  }
  sum
}

getSumMore(55,97)

numList = 1: 10
dblList = (function(x)x*2)(numList)
dblList

power = function(exp) {
  function(x){
    x^ exp
  }
}
cubed= power(3)
cubed(2)
cubed(1:5)

addFunc = list(
  add2=function(x) x + 2,
  add3=function(x) x + 3
)
addFunc$add2(5)

#Exceptions
divide= function(num1, num2){
  tryCatch(
    num1/num2,
    error = function(e){
      if(is.character(num2) || is.character(num2)){
        print('Cant Divide with Strings')
      }
    }
  )
}
divide(10,'5')
