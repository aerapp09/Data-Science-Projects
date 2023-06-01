# Bivariate visualizations for
# two qualitiative variables

# Create a grouped frequency bar chart
ggplot(
    data = movies, 
    aes(x = Rating, fill = Awards)) +
    geom_bar(position = "dodge") +
    ggtitle("Count of Movies by Rating and Awards") +
    scale_fill_discrete(labels = c("No", "Yes"))

# Create a stacked frequency bar chart
ggplot(
    data = movies, 
    aes(x = Rating, fill = Awards)) +
    geom_bar() +
    ggtitle("Count of Movies by Rating and Awards") +
    scale_fill_discrete(labels = c("No", "Yes"))

# Create a 100% stacked frequency bar chart
ggplot(
    data = movies, 
    aes(x = Rating, fill = Awards)) +
    geom_bar(position = "fill") +
    ggtitle("Proportion of Movies by Rating and Awards") +
    ylab("Proportion of Movies") +
    scale_fill_discrete(labels = c("No", "Yes"))

# NOTE: No spine plot or mosaic plot
