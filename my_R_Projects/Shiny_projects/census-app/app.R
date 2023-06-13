library(maps)
library(mapproj)
source("helpers.R")
counties <- readRDS("data/counties.rds")

#output from shiny app

library(shiny)

# Define UI ----
ui <- fluidPage(
  titlePanel("censusVis"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create a demographic of maps with
               information from the 2010 US Census."),
      selectInput("var",
                  label= 'Choose a variable to display',
                  choices = c("Percent White",
                              "Percent Black",
                              "Percent Hispanic", 
                              'Percent Asian'),
                  selected = 'Percent White'),
      sliderInput("range",
                  label = 'Range of interests:',
                  min = 0, max = 100, value = c(0, 100))
    ),
    mainPanel(
      plotOutput('map')
    )
  )
)
#shiny 'output' needs a character string. The user
#will not see this, it is the name of the reactive
#element
# Define server logic ----

server <- function(input, output) {

  output$map <- renderPlot({
    data<- switch(input$var,
                  'Percent White' = counties$white,
                  'Percent Black' = counties$black,
                  'Percent Hispanic' = counties$hispanic,
                  'Percent Asian' = counties$asian)
    color<- switch(input$var,
                  'Percent White' = 'darkgreen',
                  'Percent Black' = 'black',
                  'Percent Hispanic' = 'darkorange',
                  'Percent Asian' = 'darkred')
    min<- (input$range[1])
    max<- (input$range[2])
    
    percent_map(var = data, color= color, legend.title= input$var, max= max, min= min)
  })
}

#the 'renderText' is one of shiny's render
#functions. They capture an R expression and 
#do some processing on teh expression

#our app has two widges, one named 'range' 
#and the other 'var'. These will be saved 
#as input as input$var input$range

#shiny tracks which outputs depend on which
#widgets, When a user changes a widget, shiny 
#will rebuild all of the outputs

# Run the app ----
shinyApp(ui, server)