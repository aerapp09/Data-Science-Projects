# Bivariate visualizations for 
# two quantitiative variables

# Create scatterplot
ggplot(
    data = movies, 
    aes(x = Runtime, y = Box.Office)) +
    geom_point() + 
    ggtitle("Runtime vs. Box Office Revenue") +
    xlab("Runtime (minutes)") +
    ylab("Box Office ($M)")

# Add a linear regression line
ggplot(
    data = movies, 
    aes(x = Runtime, y = Box.Office)) +
    geom_point() + 
    geom_smooth(method = "lm") +
    ggtitle("Runtime vs. Box Office Revenue") +
    xlab("Runtime (minutes)") +
    ylab("Box Office ($M)")


# Create a frequency heatmap
ggplot(
    data = movies, 
    aes(x = Runtime, y = Box.Office)) +
    stat_bin2d() + 
    ggtitle("Runtime vs. Box Office Revenue") +
    xlab("Runtime (minutes)") +
    ylab("Box Office ($M)")

# Create a hexagonal binned frequency heatmap
ggplot(
    data = movies,
    aes(x = Runtime, y = Box.Office)) +
    stat_binhex() + 
    ggtitle("Runtime vs. Box Office Revenue") +
    xlab("Runtime (minutes)") +
    ylab("Box Office ($M)")

# Create a contour plot of density
ggplot(
    data = movies, 
    aes(x = Runtime, y = Box.Office)) +
    geom_density2d() + 
    ggtitle("Runtime vs. Box Office Revenue") +
    xlab("Runtime (minutes)") +
    ylab("Box Office ($M)")

# Create a level plot of density
ggplot(
    data = movies, 
    aes(x = Runtime, y = Box.Office)) +
    stat_density2d(aes(fill = ..level..), geom = "polygon") + 
    ggtitle("Runtime vs. Box Office Revenue") +
    xlab("Runtime (minutes)") +
    ylab("Box Office ($M)")

# NOTE: 3D visualizations do not exist in ggplot2

# Create a step chart
ggplot(
    data = timeSeries, 
    aes(x = Year, y = Box.Office)) +
    geom_step() +
    expand_limits(y = 0) + 
    ggtitle("Box Office Revenue by Year") +
    xlab("Year") +
    ylab("Box Office ($M)")

# Create a line chart
ggplot(
    data = timeSeries, 
    aes(x = Year, y = Box.Office)) +
    geom_line() +
    expand_limits(y = 0) + 
    ggtitle("Average Box Office Revenue by Year") +
    xlab("Year") +
    ylab("Box Office ($M)")
       
# Create an area chart
ggplot(
    data = timeSeries, 
    aes(x = Year, y = Box.Office)) +
    geom_area() + 
    ggtitle("Average Box Office Revenue by Year") +
    xlab("Year") +
    ylab("Box Office ($M)")
