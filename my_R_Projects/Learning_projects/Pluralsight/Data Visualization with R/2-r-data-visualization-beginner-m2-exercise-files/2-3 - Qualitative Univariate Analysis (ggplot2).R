# Load ggplot2 package
library(ggplot2)

# Create a frequency bar chart for rating
ggplot(
    data = movies, 
    aes(x = Rating)) + 
    geom_bar() +
    ggtitle("Count of Movies by Rating")

# Create a horizontal frequency bar chart for genre
ggplot(
    data = movies, 
    aes(x = Rating)) +
    geom_bar() +
    coord_flip() +
    ggtitle("Count of Movies by Rating")

# Create cleveland dot plot
ggplot(
    data = movies, 
    aes(x = Rating)) + 
    geom_point(stat = "count") +
    coord_flip() +
    ggtitle("Count of Movies by Rating")

# Create a pie chart
ggplot(
    data = movies, 
    aes(x = "", fill = Rating)) +
    geom_bar() +
    coord_polar(theta = "y") +
    ggtitle("Count of Movies by Rating") +
    ylab("")

# Create a pie chart of awards
ggplot(
    data = movies, 
    aes(x = "", fill = Awards)) +
    geom_bar() +
    coord_polar(theta = "y") +
    ggtitle("Proportion of Movies that Won Awards") +
    ylab("")
