#intro to shiny, Shiny Example plot
library(shiny)

runExample('01_hello')

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

library(shiny)