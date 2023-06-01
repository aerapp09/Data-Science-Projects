# Create a data frame
df <- data.frame(
    Name = c("a", "b", "c"),
    Value = c(1, 2, 3))

# Display the data frame
print(df)

# Plot the data frame using default parameters
plot(df)

# Plot using default parameter order
plot(df$Name, df$Value)

# Plot using named parameters
plot(
    x = df$Name,
    y = df$Value)

# Create a bar chart
barplot(
    names = df$Name,
    height = df$Value,
    col = "skyblue",
    main = "Hello World",
    xlab = "Name",
    ylab = "Value")

# View the help files
?plot

?barplot

?par
