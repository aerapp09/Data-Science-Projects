xy1 = matrix(data=c(1,2,3,4,5,
                    1,2,3,4,5), nrow=5, ncol=5)
plot(xy1)


x2 = c(1,2,3,4,5)
y2 = c(1,2,3,4,5)
plot(x2,y2,type="l")

x2 = c(1,2,3,4,5)
y2 = c(1,2,3,4,5)
plot(x2,y2,type="b")

x2 = c(1,2,3,4,5)
y2 = c(1,2,3,4,5)
plot(x2,y2,type="o",
     main="my plot", xlab='xaxis', ylab='yaxis',
     col='steelblue')

############ run these together and seperately to see ####

#to find colors just type in colors() in the console
#b means both 'dots' and 'line' 
x2 = c(1,2,3,4,5)
y2 = c(1,2,3,4,5)
plot(x2,y2,type="b", pch=2, lty=2,
     main="my plot", xlab='xaxis', ylab='yaxis',
     col='steelblue', xlim=c(-8,8), ylim=c(-8,8))

abline(h=c(2,4), col='red', lty=2)

################ Run these together and seperately to see####

x2 = c(1,2,3,4,5)
y2 = c(1,2,3,4,5)
plot(x2,y2,type="b")

abline(h=c(2,4), col='red', lty=2)

segments(x0=c(2,4), y0=c(2,2), x1=c(2,4), y1=c(4,4),
         col='red', lty=2)

arrows(x0=1.5, y0=4.5, x1=2.7, y1=3.25, col='blue')

text(x=1.25, y=4.75, labels='Center')

################ Run these together and seperately to see####


plot(faithful)

eruptions4 = with(faithful, faithful[eruptions > 4,])

points(eruptions4, col='red', pch=3)