# Univariate visualizations of
# a quantitiative variable

# Create a dot plot of runtime
plot(
    x = movies$Runtime, 
    y = rep(0, nrow(movies)),
    main = "Distribution of Movie Runtimes",
    xlab = "Runtime (minutes)",
    ylab = "", 
    yaxt = "n")

# Create a dot plot with alpha transparency
plot(
    x = movies$Runtime, 
    y = rep(0, nrow(movies)), 
    main = "Distribution of Movie Runtimes",
    xlab = "Runtime (minutes)",
    ylab = "", 
    yaxt = "n",
    pch = 16,
    col = rgb(0, 0, 0, 0.1))

# Add jitter to dot plot
plot(
    x = movies$Runtime, 
    y = jitter(rep(0, nrow(movies))),
    main = "Distribution of Movie Runtimes",
    xlab = "Runtime (minutes)",
    ylab = "", 
    yaxt = "n")

# Create a boxplot of runtime
boxplot(
    x = movies$Runtime, 
    horizontal = TRUE,
    main = "Distribution of Movie Runtimes",
    xlab = "Runtime (minutes)")

# Create a histogram of runtime
hist(
    x = movies$Runtime,
    main = "Distribution of Movie Runtimes",
    xlab = "Runtime (minutes)")

# Create a more course-grain histogram
hist(
    x = movies$Runtime,
    breaks = 10,
    main = "Distribution of Movie Runtimes",
    xlab = "Runtime (minutes)")

# Create a more fine-grain histogram
hist(
    x = movies$Runtime,
    breaks = 30,
    main = "Distribution of Movie Runtimes",
    xlab = "Runtime (minutes)")

# Create a density plot of runtime
plot(
    x = density(movies$Runtime),
    main = "Distribution of Movie Runtimes",
    xlab = "Runtime (minutes)")

# Create small multiples of all four
par(mfrow = c(4, 1))

plot(
    x = movies$Runtime, 
    y = jitter(rep(0, nrow(movies))), 
    xlim = c(0, 250),
    main = "Distribution of Movie Runtimes",
    xlab = "",
    ylab = "", 
    yaxt = "n",
    pch = 16,
    col = rgb(0, 0, 0, 0.1))

boxplot(
    x = movies$Runtime,
    ylim = c(0, 250),
    horizontal = TRUE)

hist(
    x = movies$Runtime,
    xlim = c(0, 250),
    main = "",
    xlab = "",
    ylab = "",
    yaxt = "n")

plot(
    x = density(movies$Runtime),
    xlim = c(0, 250),
    main = "",
    xlab = "Runtime (minutes)",
    ylab = "",
    yaxt = "n")

# Reset multi-row display
par(mfrow = c(1, 1))
