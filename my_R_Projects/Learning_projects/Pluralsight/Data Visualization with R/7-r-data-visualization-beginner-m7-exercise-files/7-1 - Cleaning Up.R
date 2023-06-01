# Cleaning up data visualizations

# Create a frequency bar chart with defaults
plot(movies$Rating)

# Add context to our bar chart
plot(
    x = movies$Rating,
    main = "Count of Movies by MPAA Rating Category",
    xlab = "MPAA Rating Category",
    ylab = "Count of Movies")

# Create a color palette
install.packages("RColorBrewer")

library(RColorBrewer)

palette <- brewer.pal(9, "Pastel1")

# Clean up our bar chart
plot(
    x = movies$Rating,
    col = palette[2],
    border = NA,
    main = "Count of Movies by MPAA Rating Category",
    xlab = "MPAA Rating Category",
    ylab = "Count of Movies")

# Save as a PNG image
png(
    filename = "Count of Movies by Rating.png",
    width = 640, 
    height = 480)

plot(
    x = movies$Rating,
    col = palette[2],
    border = NA,
    main = "Count of Movies by MPAA Rating Category",
    xlab = "MPAA Rating Category",
    ylab = "Count of Movies")

dev.off()

# Save ggplot2 data visualization
?ggsave

# View help for plots and parameters
?barplot

?par

