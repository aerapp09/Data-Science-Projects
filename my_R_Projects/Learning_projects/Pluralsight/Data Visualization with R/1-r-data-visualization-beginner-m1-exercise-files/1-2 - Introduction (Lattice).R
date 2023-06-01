# Install the lattice package
install.packages("lattice")

# Load the lattice package
library(lattice)

# Create a data frame
df <- data.frame(
    Name = c("a", "b", "c"),
    Value = c(1, 2, 3))

# Plot with defaults
dotplot(
    x = Value ~ Name,
    data = df)

# Plot with parameters
dotplot(
    x = Value ~ Name,
    data = df,
    main = "Hello World",
    xlab = "Name",
    ylab = "Value")

# Create a bar chart
barchart(
    x = Value ~ Name,
    data = df,
    col = "skyblue",
    main = "Hello World",
    xlab = "Name",
    ylab = "Value")

# View the help files
?barchart

?formula
