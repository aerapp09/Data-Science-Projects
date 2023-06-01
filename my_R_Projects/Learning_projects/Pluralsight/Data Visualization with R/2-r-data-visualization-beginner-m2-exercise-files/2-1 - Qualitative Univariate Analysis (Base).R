# Set working directory
setwd("C:/Pluralsight")

# Load movie data from CSV file
movies <- read.csv("Movies.csv")

# Peek at the data
head(movies)

# Univariate visualizations for
# a qualitiative variable

# Create a frequency bar chart of ratings
plot(
    x = movies$Rating,
    main = "Count of Movies by Rating",
    xlab = "Rating",
    ylab = "Count of Movies")

# Create a horizontal bar chart
plot(
    x = movies$Rating, 
    horiz = TRUE,
    main = "Count of Movies by Rating",
    xlab = "Count of Movies",
    ylab = "Rating")

# Create a Cleveland dot plot
dotchart(
    x = table(movies$Rating),
    pch = 16,
    main = "Count of Movies by Rating",
    xlab = "Count of Movies",
    ylab = "Rating")

# Create a pie chart of ratings
pie(
    x = table(movies$Rating),
    main = "Count of Movies by Rating")

# Create a pie chart of awards
pie(
    x = table(movies$Awards),
    clockwise = TRUE,
    main = "Proportion of Movies that Won Awards")
