weburl<- 'https://docs.google.com/spreadsheets/d/1-FN8CxY8IqRWT2JJUrfMhPsn4cZ-Pkd2kcjvPI8I6Bk/edit#gid=0'
library(googlesheets4)
job<- read_sheet(weburl)
job = job[ 3:4, ]
library(janitor)

#add row
#################

job[nrow(df) + 1,] <- list(, , )