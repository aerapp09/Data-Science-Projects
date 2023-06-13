#beyond bivariate analysis:

#trivariate analysis: 2qual 1 quant, 1qual 2 quant, 3 qual, 3 quant
#n-variable multivariate.

#spatial analysis (longditude, latitude)
#hiearchal analysis (parent, child)
#graph/network analysis (relationship btw entities like graphs)
#textal analysis (analysis of text)
#animated and interactive vis can be made of all these


##############BEGINNING OF ALL: #########
##############The question##########

#ex: how many movies were released in each
#rating category from 2000 to 2015?

#this is a quantitative question:
#frequency of observations for a quantitative
#variable, that is movie ratings
#can create a bar graph of the movies by rating

plot(as.factor(movies$Rating))

#keeping the question in mind helps
#us focus on the goal and helps us 
#decide on a data visualization

#important to use the right tool for
#the job. This starts with understanding
#the question for the audience. What is 
#the audience trying to understand?

# out of box data visualisations good
#enough for exploratory processes. 
#if we are planning to present it to
#an audience we need to spend extra time
#and effort cleaning up the visualizations
#creating human readable titles, labels,
#legends. Maximise data to ink ratio

plot(
  x= as.factor(movies$Rating),
  main = 'Count of movies by Rating',
  xlab = 'MPAA Rating',
  ylab = 'Number of Movies')

#############ColorBrewer###########
#comes highly recommended
#create color palette
library('RColorBrewer')
palette<- brewer.pal(9, 'Pastel1')
plot(
  x= as.factor(movies$Rating),
  col = palette,
  border = NA,
  main = 'Count of movies by Rating',
  xlab = 'MPAA Rating',
  ylab = 'Number of Movies')

#save as png
png(
  filename= 'Count of Movies by Rating.png',
  width = 640,
  height = 480)
)
dev.off()
plot(
  x= as.factor(movies$Rating),
  col = palette[2],
  border = NA,
  main = 'Count of movies by Rating',
  xlab = 'MPAA Rating',
  ylab = 'Number of Movies')

?ggplot
