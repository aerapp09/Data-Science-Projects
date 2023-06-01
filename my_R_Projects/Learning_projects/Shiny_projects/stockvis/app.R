#############Using reactive
#using reactive in server part of shiny app
#prevents unwanted repetition of functions 
#that do not change when the user uses a widget

#In this example the 'reactive' function, R
#stores the values within the function and 
#only reruns the functions within when a 
#parameter inside changes. 

#in this example I placed reactive in
#one output function that fetches data
#from yahooFinance. If this happened every
#time yahoo would block further requests
#as done by a bot. 

#the second uses a function in the attached 
#helper.R The 'adjust' function adjusts
#values using taken from Consumer Price Index
#data to transform historical prices to present
#day. This function similarly queries an 
#external source and we only want to do that 
#when necessary i.e. when the user checks 
#the 'adjust for inflation' box. 

# Load packages ----
library(shiny)
library(quantmod)

# Source helpers ----
source("helpers.R")

# User interface ----
ui <- fluidPage(
  titlePanel("stockVis"),

  sidebarLayout(
    sidebarPanel(
      helpText("Select a stock to examine.

        Information will be collected from Yahoo finance."),
      textInput("symb", "Symbol", "SPY"),

      dateRangeInput("dates",
                     "Date range",
                     start = "2013-01-01",
                     end = as.character(Sys.Date())),

      br(),
      br(),

      checkboxInput("log", "Plot y axis on log scale",
                    value = FALSE),

      checkboxInput("adjust",
                    "Adjust prices for inflation", value = FALSE)
    ),

    mainPanel(plotOutput("plot"))
  )
)

# Server logic
server <- function(input, output) {

  dataInput <- reactive({
    getSymbols(input$symb, src = "yahoo",
               from = input$dates[1],
               to = input$dates[2],
               auto.assign = FALSE)
  })
  finalInput<- reactive({
    if (!input$adjust) return (dataInput())
    adjust(dataInput())
  })
  output$plot <- renderPlot({
    
    chartSeries(finalInput(), theme = chartTheme("white"),
                type = "line", log.scale = input$log, TA = NULL)
  })
}

# Run the app
shinyApp(ui, server)
