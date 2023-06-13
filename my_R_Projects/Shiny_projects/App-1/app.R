library(shiny)

#define UI 
ui <- fluidPage(
  titlePanel("My Shiny App"),
  sidebarLayout(
    sidebarPanel(
      h2('Installation'),
      p('Shiny is availabe on CRAN, so you can install it in the usual way from your R console:'),
      code('install.packages("shiny")'),
      br(),
      br(),
      br(),
      img(src = 'rstudio.png', height = 50, width = 170),
      p('Shiny is a product of',a('Rstudio'))
    ),
    mainPanel(
      h1("Introducting Shiny"),
      p("Shiny is a new package from Rstudio that makes it", 
          em ('incredibly easy'), 
          'to build interactive web applications with R.'),
      br(),
      p("For an introduction and live examples, visit the", 
        a('Shiny Homepage.',
          href = 'http://shiny.rstudio.com')),
      br(),
      h2('Features'),
      p('- Build useful web applications with only a few lines of code- no JavaScript required.'),
      p('- Shiny application are automattically "live" in the same way that',
        strong("spreadsheets"), 'are live. Outputs change instantly as users modify inputs, without requiring a reload of the browser.'),
      img(src= '3d_child_food_pref.png')
    )
  )
)

server <- function(input, output) {
  
}

shinyApp(ui = ui, server = server)

