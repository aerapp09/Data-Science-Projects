sqrt(x=100)

log(x=4, base=2)

exp(x=2)

sum(c(1,2,3))

randD1 = c(1,5,6,7,12,15)
mean(randD1)
median(randD1)

min(randD1)
max(randD1)
range(randD1)

ceiling(4.5)
floor(4.5)

cumsum(c(1,2,3))

cumprod(c(1,2,3))

cummax(c(7:9, 4:6, 1:3))
cummin(c(7:9, 4:6, 1:3))

sample(0:1, 10, replace=T)
sample(0:20, 10, replace=T)

#pie chart
foodPref=c(15,35, 10, 25, 15)
foodLabels = c('Spaghetti', 'Pizza', 'MacnCheese',
               'Chicken', 'Tacos')
png(file='chilc_food_pref.png')

colors=rainbow(length(foodPref))

pie(foodPref, foodLabels, main="food prefs",
    col=colors)

legend('topright', c('Spaghetti', 'Pizza', 'MacnCheese',
                      'Chicken', 'Tacos'), cex=0.8,
                     fill=colors)
dev.off()

######## 3 D pie chart#############
#install packages in console with install.packages(package)

library(plotrix)

foodPref=c(15,35, 10, 25, 15)
foodLabels = c('Spaghetti', 'Pizza', 'MacnCheese',
               'Chicken', 'Tacos')
png(file='3d_child_food_pref.png')

pie3D(foodPref, labels= foodLabels, main="food prefs",
    explode = 0.1, start=pi/2, labelcex=0.8)


dev.off()


############ Bar Charts #########

library(plotrix)

foodPref=c(15,35, 10, 25, 15)
foodLabels = c('Spaghetti', 'Pizza', 'MacnCheese',
               'Chicken', 'Tacos')
png(file='food_pref_bar_chart.png')

colors= rainbow(length(foodPref))

barplot(foodPref, names.arg= foodLabels, main="food prefs",
        xlab='Votes', ylab='Food Options', col=colors)


dev.off()


###########Regression Analysis###########
pressure = read.csv('datasets/blood_pressure.csv')
pressuredata= pressure[,c('bp_before','bp_after')]
relation=lm(pressuredata$bp_before~pressuredata$bp_after)
png(file='BP_bf_af_regression.png')

plot(pressuredata$bp_before, pressuredata$bp_after,
     main='Bp Before and After Regression',
     abline(lm(pressuredata$bp_before~pressuredata$bp_after)),
     xlab='bp before', ylab='bp after')

dev.off()