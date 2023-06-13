######################widgets
#Widgets need: a name for the widget
#the user will not see this name
#it should be a character string
#a label: this label will appear with the widget 
#in the app, is a character string or empty strring

#widget gallery
#https://shiny.posit.co/r/gallery/widgets/widget-gallery/?_gl=1*oaciaf*_ga*NzU0MDcyOTUuMTY4NTEyODI0NA..*_ga_2C0WZ1JHG0*MTY4NTU0MTU5Ni43LjEuMTY4NTU0MTYyNS4wLjAuMA..

library(shiny)

# Define UI ----
ui <- fluidPage(
  titlePanel("censusVis"),
  sidebarLayout(
    sidebarPanel(
               helpText("Create a demographic of maps with information from the 2010 US Census."),
               selectInput("select", h6("Choose a variable to display"), 
                           choices = list("Percent White" = 1, "Percent Black" = 2,
                                          "Percent Hispanic" = 3, 'Percent Asian' =4), selected = 1),
               sliderInput("slider2", "",
                           min = 0, max = 100, value = c(0, 100))
        ),
        mainPanel())
  )
# Define server logic ----
server <- function(input, output) {
}

# Run the app ----
shinyApp(ui = ui, server = server)

