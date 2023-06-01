#iris shiny app
#load libraries
library(ggplot2)
library(shiny)
library(dplyr)
data(iris)

#output from shiny app


# Define UI ----
ui <- fluidPage(
  titlePanel(strong("Iris Petal Length vs Width")),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create a scatter plot with the Iris 
               species' petal width on x axis and petal 
               length on the y axis."),
      checkboxGroupInput(as.data.frame("var"),
                         label= 'Choose species to display',
                         choices = c("setosa",
                                     "versicolor",
                                     "virginica"),
                         selected = 'virginica'),
      sliderInput("range",
                  label = 'Petal Length(cm):',
                  min = 0, max = 8, value = c(0, 8)),
      img(src= 'rstudio.png', width= 170, heigth = 60)
    ),
    mainPanel(
      h2(em('Plotting Iris Data')),
      p('The flower being measured is:', 
        textOutput('text', inline=TRUE)),
      plotOutput('plot')
    )
  )
)

# Define server logic ----

server <- function(input, output) {
  output$plot <- renderPlot({
    data<- switch(input$var,
                  'setosa' = filter(iris, iris$Species == 'setosa'),
                  'versicolor' = filter(iris, iris$Species == 'versicolor'),
                  'virginica' = filter(iris, iris$Species == 'virginica'))
    color<- switch(input$var,
                   'setosa' = 'purple',
                   'versicolor' = 'black',
                   'virginica' = 'magenta')
    min<- (input$range[1])
    max<- (input$range[2])
    
    ggplot(
      data = data,
      aes(x= Petal.Width, y=Petal.Length)) +
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