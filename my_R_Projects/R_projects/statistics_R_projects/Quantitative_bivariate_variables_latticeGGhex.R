#Bivariate visualization of QUantitative variables

movies<- read.csv('datasets/movies3.csv')

#create scatterplot
plot(
  x = movies$Runtime,
  y = movies$Box.Office,
  main = 'Movies Runtime vs Boxoffice',
  xlab = 'Runtime (min)',
  ylab = 'Boxoffice ($M)')
  

#linear regression model
model <- lm(movies$Box.Office~movies$Runtime)

#draw the linear regression line on the plot
lines(
  x = movies$Runtime,
  y = model$fitted,
  col = 'red',
  lwd =3)
)

library(hexbin)
#hexagonal binned frequency heatmap
hexbin<- hexbin(
  x = movies$Runtime,
  y = movies$Box.Office,
  xbins = 30,
  xlab = 'Movies Runtime (min)',
  ylab = 'Movies Boxoffice ($M)'
)

plot(
  x = hexbin,
  main = 'Runtime of movies vs Boxoffice Revenue')
)

install.packages('MASS')
library(MASS)

#2d kernel density estimation
density2d<- kde2d(
  x= movies$Runtime,
  y = movies$Box.Office,
  n = 50)

#contour plot of density
contour(
  x=density2d$x,
  y=density2d$y,
  z=density2d$z,
  main = 'Movies Runtime vs Boxoffice',
  xlab = 'Runtime (min)',
  ylab = 'Boxoffice ($M)')

#level plot of density##########like infared ########
image(
  x=density2d$x,
  y=density2d$y,
  z=density2d$z,
  col=topo.colors(100),
  main = 'Movies Runtime vs Boxoffice',
  xlab = 'Runtime (min)',
  ylab = 'Boxoffice ($M)')

#mesh plot ########cool 3d plot ##########
persp(
  x=density2d$x,
  y=density2d$y,
  z=density2d$z,
  main = 'Movies Runtime vs Boxoffice',
  xlab = 'Runtime (min)',
  ylab = 'Boxoffice ($M)',
  zlab = 'Density')

#surface plot of density#####like mesh but color###
palette(topo.colors(100))

persp(
  x=density2d$x,
  y=density2d$y,
  z=density2d$z,
  col = cut(density2d$z, 100),
  main = 'Movies Runtime vs Boxoffice',
  xlab = 'Runtime (min)',
  ylab = 'Boxoffice ($M)',
  zlab = 'Density')

palette('default')

#load time series data
timeseries<-read.csv('datasets/Timeseries.csv')
head(timeseries)

#step chart 
plot(
  x= timeseries,
  type ='s',
  ylim = c(0, max(timeseries$Box.Office)),
  main = 'Average Box Office Revenue by Year',
  xlab='Year',
  ylab='Box Office($M)')

#line chart
plot(
  x= timeseries,
  type ='l',
  ylim = c(0, max(timeseries$Box.Office)),
  main = 'Average Box Office Revenue by Year',
  xlab='Year',
  ylab='Box Office($M)')

#######################Lattice
library(lattice)
#scatterplot
xyplot(
  x=Box.Office~Runtime,
  data=movies,
  main = 'Movies Runtime vs Boxoffice',
  xlab = 'Runtime (min)',
  ylab = 'Boxoffice ($M)'
)

#add linear regression line
xyplot(
  x=Box.Office~Runtime,
  data=movies,
  type = c('p', 'r'),
  main = 'Movies Runtime vs Boxoffice',
  xlab = 'Runtime (min)',
  ylab = 'Boxoffice ($M)'
)

#library hexbin binned frequency heatmap
hexbinplot(
  x= Box.Office ~ Runtime,
  data = movies,
  xbin = 30,
  main = 'Runtime vs Box Office Revenue',
  xlab = 'Runtime (min)',
  ylab = 'Box office returns ($M)'
)

#grid from 2d kernel density
grid <- expand.grid(
  x = density2d$x,
  y = density2d$y)

grid$z <- as.vector(density2d$z)

head(grid)

contourplot(
  x = z~ x*y,
  data = grid,
  main = 'Runtime vs Box Office Revenue',
  xlab = 'Runtime (min)',
  ylab = 'Box office returns ($M)'
)

#levelplot of density
levelplot(
  x = z~ x*y,
  data = grid,
  main = 'Runtime vs Box Office Revenue',
  xlab = 'Runtime (min)',
  ylab = 'Box office returns ($M)'
)

#mesh plot of density
wireframe(
  x = z~ x*y,
  data = grid, 
  main = 'Runtime vs Box Office Revenue',
  xlab = 'Runtime (min)',
  ylab = 'Box office returns ($M)',
  zlab = 'Density'
)
#surface plot of density
wireframe(
  x = z~ x*y,
  data = grid, 
  drape=TRUE,
  main = 'Runtime vs Box Office Revenue',
  xlab = 'Runtime (min)',
  ylab = 'Box office returns ($M)',
  zlab = 'Density'
)

#create step chart
xyplot(
  x= Box.Office ~ Year,
  data = timeseries,
  type = 'S',
  ylim = c(0, max(timeseries$Box.Office)),
  main = 'Average Box Office Revenue by year',
  xlab = 'Year',
  ylab= 'Average Box Office')

#line chart
xyplot(
  x= Box.Office ~ Year,
  data = timeseries,
  type = 'l',
  ylim = c(0, max(timeseries$Box.Office)),
  main = 'Average Box Office Revenue by year',
  xlab = 'Year',
  ylab= 'Average Box Office')

#lattice extra
install.packages("latticeExtra")
library(latticeExtra)
#area chart
xyplot(
  x= Box.Office ~ Year,
  data = timeseries,
  panel = panel.xyarea,
  ylim = c(0, max(timeseries$Box.Office)),
  main = 'Average Box Office Revenue by year',
  xlab = 'Year',
  ylab= 'Average Box Office')


########################GG PLOT
library(ggplot2)
#scatterplot
ggplot(
  data=movies,
  aes(x= Runtime, y=Box.Office)) +
  geom_point() +
  ggtitle('Runtime vs Box Office Revenue') +
  xlab('Runtime(min)') +
  ylab('Box Office ($M)')

#add linear regression line
ggplot(
  data=movies,
  aes(x= Runtime, y=Box.Office)) +
  geom_point() +
  geom_smooth(method = 'lm') +
  ggtitle('Runtime vs Box Office Revenue') +
  xlab('Runtime(min)') +
  ylab('Box Office ($M)')

#frequency heatmap
ggplot(
  data = movies, 
  aes(x = Runtime, y= Box.Office)) +
  stat_bin2d() +
  ggtitle('Runtime vs Box Office Revenue') +
  xlab('Runtime(min)') +
  ylab('Box Office ($M)')
)

#hexogonal binned frequency heatmap
ggplot(
  data = movies, 
  aes(x = Runtime, y= Box.Office)) +
  stat_binhex() +
  ggtitle('Runtime vs Box Office Revenue') +
  xlab('Runtime(min)') +
  ylab('Box Office ($M)')

#contour plot density
ggplot(
  data = movies, 
  aes(x = Runtime, y= Box.Office)) +
  geom_density2d() +
  ggtitle('Runtime vs Box Office Revenue') +
  xlab('Runtime(min)') +
  ylab('Box Office ($M)')

#level plot of density
ggplot(
  data = movies, 
  aes(x = Runtime, y= Box.Office)) +
  stat_density2d(aes(fill = ..level..), geom = 'polygon') +
  ggtitle('Runtime vs Box Office Revenue') +
  xlab('Runtime(min)') +
  ylab('Box Office ($M)')

#*** No 3d visualisations in ggplot2

#*step plot
ggplot(
  data = timeseries, 
  aes( x = Year, y = Box.Office)) +
  geom_step() +
  expand_limits( y=0 ) +
  ggtitle('Runtime vs Box Office Revenue') +
  xlab('Runtime(min)') +
  ylab('Box Office ($M)')

#linechart 
ggplot(
  data = timeseries, 
  aes( x = Year, y = Box.Office)) +
  geom_line() +
  expand_limits( y=20 ) +
  ggtitle('Runtime vs Box Office Revenue') +
  xlab('Runtime(min)') +
  ylab('Box Office ($M)')
  
#area chart
ggplot(
  data = timeseries, 
  aes( x = Year, y = Box.Office)) +
  geom_area() +
  ggtitle('Runtime vs Box Office Revenue') +
  xlab('Runtime(min)') +
  ylab('Box Office ($M)')
