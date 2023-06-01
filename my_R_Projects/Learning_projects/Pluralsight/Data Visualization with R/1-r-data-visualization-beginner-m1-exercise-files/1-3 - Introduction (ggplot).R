# Install the ggplot2 package
install.packages("ggplot2")

# Load the ggplot2 package
library(ggplot2)

# Create a data frame
df <- data.frame(
    Name = c("a", "b", "c"),
    Value = c(1, 2, 3))

# Plot with defaults
ggplot(
    data = df, 
    aes(
        x = Name, 
        y = Value)) +
    geom_point()

# Plot with parameters
ggplot(
    data = df, 
    aes(
        x = Name, 
        y = Value)) +
    geom_point() +
    ggtitle("Hello World") +
    xlab("Name") +
    ylab("Value")

# Create a bar chart
ggplot(
    data = df, 
    aes(
        x = Name, 
        y = Value)) +
    geom_bar(
        stat = "identity", 
        fill = "skyblue") +
    ggtitle("Hello World") +
    xlab("Name") +
    ylab("Value")

# View the help files
?ggplot

?aes

?geom_bar

?ggtitle
