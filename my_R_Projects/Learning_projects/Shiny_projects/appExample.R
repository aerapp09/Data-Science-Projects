#intro to shiny, Shiny Example plot
library(shiny)



#contained in single app.R script.
#lives in a directory (example, 'newdir/)
#and run with runApp('newdir')

#app.R has 3 components
#user interface object
#server function
#call to shinyApp function

#ui - controls layout and appearance
#server function - instructions computer 
#needs to build app
#shinyApp function creates Shiny app objects
#from explicit UI/server pair

#here is ui object for Hello Shiny example

############define UI for app that draws histogram
ui<- fluidPage(
  
  #app title
  titlePanel('Hello Wurst!'),
  
  #sidebar layout w input and output definitions
  sidebarLayout(
    
    #sidebar panel for inputs
    sidebarPanel(
      
      #input: slider for the # of bins
      sliderInput(inputId= 'bins',
                  label = 'Number of bins:',
                  min = 5,
                  max = 50, 
                  value = 30)
    ),
      #main panel for displaying outputs
      mainPanel(
        
        #output: Histogram
        plotOutput(outputId = 'distPlot')
      )
    )
  )

#server function for Hello Shiny

###########define server logic required to draw
#a histogram
server <- function(input,output) {
  
  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  output$distPlot <- renderPlot({
    
    x <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins )
    hist(x, breaks = bins, col = '#007bc2', border = 'orange',
         xlab = 'Waiting time to next eruption (in mins)',
         main = 'Histogram of waiting times')
  })
}


##############To open use app.R by:
#load shiny package
library(shiny)

ui

server 

shinyApp(ui = ui, server = server)
