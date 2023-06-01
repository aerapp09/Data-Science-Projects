#Cleaning data column wrong name, rows missing values, runtime units, revenue in multiple scales

# Load data from tab-delimited file
movies <- read.table(
  file = "datasets/Movies.txt", 
  sep = "\t", 
  header = TRUE,
  quote = "\"")

head(movies)

#column names
names(movies)

#rename variable (ie columns)
names(movies)[5] <- 'Critic.Score'

names(movies)

names(movies)[5]

#problem 2: missing values 
#count missing values
sum(is.na(movies))

#author put missing values at end 
tail(movies)

#exclude observations with missing values
movies <- na.omit(movies)
sum(is.na(movies))

#problem 3. units in runtime column
head(movies$Runtime)
#error from:
mean(movies$Runtime)
#find data type
class(movies$Runtime)
#cast from factor to character stirng ?
runtimes<- as.character(movies$Runtime)
head(runtimes)
class(runtimes)
#elimnate unit
runtimes<-sub(' min', '', runtimes)
head(runtimes)
#cast character string to integer
movies$Runtime<-as.integer(runtimes)
head(movies$Runtime)
class(movies$Runtime)
#now can perform mathematical functions
mean(movies$Runtime)

#problem 4: box office uses three units 
head(movies$Box.Office)

#function to convert box office revenue
convertBoxOffice <-function(boxOffice)
{
  stringBoxOffice <-as.character(boxOffice)
  
  replacedBoxOffice <- gsub('[$|k|M]', '', stringBoxOffice)
  
  numericBoxOffice <- as.numeric(replacedBoxOffice)
  
  if (grepl('M', boxOffice)) {
    numericBoxOffice
  } else if (grepl('k', boxOffice)){
    numericBoxOffice * 0.001
  } else {
    numericBoxOffice * 0.000001
  }
}

movies$Box.Office <- sapply(movies$Box.Office, convertBoxOffice)

#problem solved? 
head(movies$Box.Office)
class(movies$Box.Office)
mean(movies$Box.Office)

write.csv(movies, 'Movies2.csv')
