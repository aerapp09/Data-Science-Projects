# Bivariate visualizations for both a 
# qualitiative and quantitiative variable

# Download, install, and load the dplyr package
install.packages("dplyr")

library(dplyr)

# Create table of average box office by rating
average <- movies %>%
    select(Rating, Box.Office) %>%
    group_by(Rating) %>% 
    summarize(Box.Office = mean(Box.Office)) %>%
    as.data.frame()

print(average)

# Create a bivariate bar chart
barchart(
    x = Box.Office ~ Rating,
    data = average,
    main = "Average Box Office Revenue by Rating",
    xlab = "Rating",
    ylab = "Box Office ($M)")

# Create a bivariate box plot
bwplot(
    x = Box.Office ~ Rating,
    data = movies,
    main = "Box Office Revenue by Rating",
    xlab = "Rating",
    ylab = "Box Office ($M)")

# Create a notched box plot
bwplot(
    x = Box.Office ~ Rating,
    data = movies,
    notch = TRUE,
    main = "Box Office Revenue by Rating",
    xlab = "Rating",
    ylab = "Box Office ($M)")

# Create a violin plot
bwplot(
    x = Box.Office ~ Rating,
    data = movies,
    panel = panel.violin,
    main = "Box Office Revenue by Rating",
    xlab = "Rating",
    ylab = "Box Office ($M)")
