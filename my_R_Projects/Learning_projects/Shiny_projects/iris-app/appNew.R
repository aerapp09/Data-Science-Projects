#iris shiny app
library(ggplot2)
library(shiny)
data(iris)

#output from shiny app

library(shiny)

# Define UI ----
ui <- fluidPage(
  titlePanel("Iris Petal Length vs Width"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create a scatter plot with the Iris 
               species' petal width on x axis and petal 
               length on the y axis."),
      checkboxGroupInput("var",
                  label= 'Choose species to display',
                  choices = c("setosa",
                              "versicolor",
                              "virginica"),
                  selected = 'virginica'),
      sliderInput("range",
                  label = 'Petal Length(cm):',
                  min = 0, max = 8, value = c(0, 8)),
      img(src= '3d_child_food_pref.png', width= 60, heigth = 20)
    ),
    mainPanel(
      h3('Plotting Iris Data'),
      p('The flower being measured is:', 
        textOutput('text')),
      plotOutput('plot')
    )
  )
)

# Define server logic ----
plot(
  x = species$Petal.Length,
  y= species$Petal.Width
)

head(vir)
server <- function(input, output) {
  output$plot <- renderPlot({
    speciesOld <- filter(iris, iris$Species == input$var)
    species<- switch(input$var,
                   'setosa',
                   'versicolor',
                   'virginica')
    color<- switch(input$var,
                   'setosa' = 'purple',
                   'versicolor' = 'black',
                   'virginica' = 'magenta')
    min<- (input$range[1])
    max<- (input$range[2])
    
    ggplot(
      data=iris,
      aes(x= Petal.Width, y=Petal.Length, fill= Species)) +
      geom_point(color=color) +
      ggtitle('Petal Length vs Petal Width') +
      ylim(min, max) +
      xlab('Petal Width') +
      ylab('Petal Length') 
  })
  output$text <- renderText({
    paste(input$var)
  })
}

# Run the app ----
shinyApp(ui = ui, server = server)