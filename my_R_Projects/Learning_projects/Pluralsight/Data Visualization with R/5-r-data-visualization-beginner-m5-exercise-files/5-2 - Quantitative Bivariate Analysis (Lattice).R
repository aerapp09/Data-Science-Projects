# Bivariate visualizations for 
# two quantitiative variables

# Create a scatterplot
xyplot(
    x = Box.Office ~ Runtime,
    data = movies,
    main = "Runtime vs. Box Office Revenue",
    xlab = "Runtime (minutes)",
    ylab = "Box Office ($M)")

# Add a linear regression line
xyplot(
    x = Box.Office ~ Runtime,
    data = movies,
    type = c("p", "r"),
    main = "Runtime vs. Box Office Revenue",
    xlab = "Runtime (minutes)",
    ylab = "Box Office ($M)")

# Load hexbin library
library(hexbin)

# Create hexagonal binned frequency heatmap
hexbinplot(
    x =  Box.Office ~ Runtime,
    data = movies,
    xbins = 30,
    main = "Runtime vs. Box Office Revenue",
    xlab = "Runtime (minutes)",
    ylab = "Box Office ($M)")

# Create a grid from our 2D kernel density estimate
grid <- expand.grid(
    x = density2d$x,
    y = density2d$y)

grid$z <- as.vector(density2d$z)

# Display the data frame
head(grid)
  
# Create a contour plot of density
contourplot(
    x = z ~ x * y,
    data = grid,
    main = "Runtime vs. Box Office Revenue",
    xlab = "Runtime (minutes)",
    ylab = "Box Office ($M)")

# Create a level plot of density
levelplot(
    x = z ~ x * y,
    data = grid,
    main = "Runtime vs. Box Office Revenue",
    xlab = "Runtime (minutes)",
    ylab = "Box Office ($M)")

# Create mesh plot of density
wireframe(
    x = z ~ x * y,
    data = grid,
    main = "Runtime vs. Box Office Revenue",
    xlab = "Runtime (minutes)",
    ylab = "Box Office ($M)",
    zlab = "Density")

# Create surface plot of density
wireframe(
    x = z ~ x * y,
    data = grid,
    drape = TRUE,
    main = "Runtime vs. Box Office Revenue",
    xlab = "Runtime (minutes)",
    ylab = "Box Office ($M)",
    zlab = "Density")

# Create a step chart
xyplot(
    x = Box.Office ~ Year,
    data = timeSeries,
    type = "s",
    ylim = c(0, max(timeSeries$Box.Office)),
    main = "Average Box Office Revenue by Year",
    xlab = "Year",
    ylab = "Box Office ($M)")

# Create a line chart
xyplot(
    x = Box.Office ~ Year,
    data = timeSeries,
    type = "l",
    ylim = c(0, max(timeSeries$Box.Office)),
    main = "Average Box Office Revenue by Year",
    xlab = "Year",
    ylab = "Box Office ($M)")

# Download, install and load Lattice Extra package
install.packages("latticeExtra")

library(latticeExtra)

# Create an area chart
xyplot(
    x = Box.Office ~ Year,
    data = timeSeries,
    panel = panel.xyarea,
    ylim = c(0, max(timeSeries$Box.Office)),
    main = "Average Box Office Revenue by Year",
    xlab = "Year",
    ylab = "Box Office ($M)")
