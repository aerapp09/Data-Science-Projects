data(iris)
head(iris)
unique(iris$Species)
#scatterplot matrix colored by species:
plot(
  iris[1:4],
  col= as.integer(iris$Species)
)
#zoom in on one pane
plot(
  x=iris$Petal.Length,
  y=iris$Petal.Width,
  col=as.integer(iris$Species)
)
#k means cluster
#used to predict values
#n start = is a means choose X amount of random places per 
#clustered centers 
clusters<- kmeans(
  x=iris[, 1:4],
  centers = 3,
  nstart= 10)
#plot cluster as a shape
plot(
  x=iris$Petal.Length,
  y=iris$Petal.Width,
  col=as.numeric(iris$Species),
  pch=clusters$cluster
)
#shapes represent predicted values 
#colors represent observed values
#from this we can see difference of 
#observed and predicted values 

#plot of centroid of clusters
points(
  x= clusters$centers[, 'Petal.Length'],
  y=clusters$center[,'Petal.Width'],
  pch = 4,
  lwd= 4,
  col='blue')
#if we want to see the predicted numbers:
table(
  x=clusters$cluster,
  y=iris$Species)
#all setosa correctly classified in cluster 1
#48/50 versicolor correctly classified
#36/50 virginica correctly classified in cluster 2