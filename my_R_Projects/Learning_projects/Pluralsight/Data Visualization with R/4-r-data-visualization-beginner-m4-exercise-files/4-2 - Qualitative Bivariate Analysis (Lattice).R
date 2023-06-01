# Bivariate visualizations for
# two qualitiative variables

# Create a grouped frequency bar chart
barchart(
    x = awards,
    stack = FALSE,
    horizontal = FALSE,
    main = "Count of Movies by Rating and Awards",
    xlab = "Rating",
    ylab = "Count of Movies",
    auto.key = list(
        x = 0.05,
        y = 0.95,
        title = "Awards",
        text = c("No", "Yes")))

# Create a stacked frequency bar chart
barchart(
    x = awards,
    stack = TRUE,
    horizontal = FALSE,
    main = "Count of Movies by Rating and Award",
    xlab = "Rating",
    ylab = "Count of Movies",
    auto.key = list(
        x = 0.05,
        y = 0.95,
        title = "Awards",
        text = c("No", "Yes")))

# Create a proportional frequency table
matrix <- apply(awards, 1, function(x) {x / sum(x) })

proportions <- t(matrix) # transpose matrix

head(awards)

head(proportions)

# Create a 100% stacked frequency bar chart
barchart(
    x = proportions,
    stack = TRUE,
    horizontal = FALSE,
    main = "Proportion of Movies by Rating and Award",
    xlab = "Rating",
    ylab = "Proportion of Movies",
    auto.key = list(
        x = 0.70,
        y = 1.05,
        title = "Awards",
        columns = 2,
        text = c("No", "Yes"),
        background = "white"))

# NOTE: No spine plot or mosaic plot in lattice
