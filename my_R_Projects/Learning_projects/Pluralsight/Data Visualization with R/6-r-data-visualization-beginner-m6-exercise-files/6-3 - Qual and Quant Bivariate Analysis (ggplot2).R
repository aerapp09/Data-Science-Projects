# Bivariate visualizations for both a 
# qualitiative and quantitiative variable

# Create a bivariate bar chart
ggplot(
    data = average, 
    aes(x = Rating, y = Box.Office)) +
    geom_bar(stat = "identity") +
    ggtitle("Average Box Office Revenue by Rating") +
    xlab("Rating") +
    ylab("Box Office ($M)")

# Create a bivariate box plot
ggplot(
    data = movies, 
    aes(x = Rating, y = Box.Office)) +
    geom_boxplot() +
    ggtitle("Box Office Revenue by Rating") +
    xlab("Rating") +
    ylab("Box Office ($M)")

# Create a notched box plot
ggplot(
    data = movies, 
    aes(x = Rating, y = Box.Office)) +
    geom_boxplot(notch = TRUE) +
    ggtitle("Box Office Revenue by Rating") +
    xlab("Rating") +
    ylab("Box Office ($M)")

# Create a violin plot
ggplot(
    data = movies, 
    aes(x = Rating, y = Box.Office)) +
    geom_violin() +
    ggtitle("Box Office Revenue by Rating") +
    xlab("Rating") +
    ylab("Box Office ($M)")
