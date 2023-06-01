# Load lattice package
library(lattice)

# Create frequency table of ratings
table <- table(movies$Rating)

ratings <- as.data.frame(table)

names(ratings)[1] <- "Rating"

names(ratings)[2] <- "Count"

print(ratings)

# Create a frequency bar chart
barchart(
    x = Count ~ Rating,
    data = ratings,
    main = "Count of Movies by Rating",
    xlab = "Rating")

# Create a horizontal bar chart
barchart(
    x = Rating ~ Count,
    data = ratings,
    main = "Count of Movies by Rating",
    ylab = "Rating")

# Create Cleveland dot plot
dotplot(
    x = Rating ~ Count,
    data = ratings,
    main = "Count of Movies by Rating",
    ylab = "Rating")

# Create a part-of-whole frequency bar chart
histogram(
    x = ~Rating,
    data = movies,
    main = "Percent of Movies by Rating")
