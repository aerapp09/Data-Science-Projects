#Every Shiny app has the same 
#structure: an app.R file that 
#contains ui and server. You can 
#create a Shiny app by making a new 
#directory and saving an app.R file 
#inside it. It is recommended that 
#each app will live in its own 
#unique directory.

#You can run a Shiny app by giving
#the name of its directory to the 
#function runApp. For example if
#your Shiny app is in a directory 
#called my_app, run it with the 
#following code:
library(shiny)
runApp('App-1')


#by default, shiny apps display in
#'normal' mode.
#to play in showcase mode:
runApp('App-1', display.mode = 'showcase')

#census-app
runApp('census-app',display.mode='showcase')

#iris-app
runApp('iris-app', display.mode = 'showcase')