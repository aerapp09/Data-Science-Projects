# Univariate visualizations of
# a quantitiative variable

# Create dot plot for runtime
stripplot(
    x = ~Runtime,
    data = movies,
    main = "Distribution of Movie Runtimes",
    xlab = "Runtime (minutes)")

# Create dot plot with jitter
stripplot(
    x = ~Runtime,
    data = movies,
    jitter = TRUE, 
    amount = 0.5,
    main = "Distribution of Movie Runtimes",
    xlab = "Runtime (minutes)")

# Create box plot with lattice
bwplot(
    x = ~Runtime,
    data = movies,
    main = "Distribution of Movie Runtimes",
    xlab = "Runtime (minutes)")

# Create histogram with lattice
histogram(
    x = ~Runtime,
    data = movies,
    main = "Distribution of Movie Runtimes",
    xlab = "Runtime (minutes)")

# Create density plot with lattice
densityplot(
    x = ~Runtime,
    data = movies,
    main = "Distribution of Movie Runtimes",
    xlab = "Runtime (minutes)")

# Create small multiples of all four
# NOTE: Not exactly lined up
dot <- dotplot(
    x = ~Runtime,
    data = movies,
    main = "Distribution of Movie Runtimes",
    xlab = "")

print(
    x = dot, 
    position = c(0, 0.75, 1, 1), 
    more = TRUE)

box <- bwplot(
    x = ~Runtime,
    data = movies,
    xlab = "")

print(
    x = box, 
    position = c(0, 0.50, 1, 0.75), 
    more = TRUE)

hist <- histogram(
    x = ~Runtime,
    data = movies,
    xlab = "",
    ylab = "",
    scales = list(y = list(draw = FALSE)))

print(
    x = hist, 
    position = c(0, 0.25, 1, 0.50),
    more = TRUE)

density <- densityplot(
    x = ~Runtime,
    data = movies,
    ylab = "",
    scales = list(y = list(draw = FALSE)))

print(
    x = density, 
    position = c(0, 0, 1, 0.25))
