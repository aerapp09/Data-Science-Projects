# Bivariate visualizations for both a 
# qualitiative and quantitiative variable

# Create a bivariate bar graph
average <- tapply(
    movies$Box.Office, 
    movies$Rating, 
    mean)

print(average)

barplot(
    height = average,
    main = "Average Box Office Revenue by Rating",
    xlab = "Rating",
    ylab = "Box Office ($M)")

# Create a bivariate box plot
plot(
    x = movies$Rating, 
    y = movies$Box.Office,
    main = "Box Office Revenue by Rating",
    xlab = "Rating",
    ylab = "Box Office ($M)")

# Create a notched box plot
plot(
    x = movies$Rating, 
    y = movies$Box.Office,
    notch = TRUE,
    main = "Box Office Revenue by Rating",
    xlab = "Rating",
    ylab = "Box Office ($M)")
