library("shiny")
library("lintr")
library("plotly")
vaccines <-
  read.csv("../data/us_state_vaccinations.csv", stringsAsFactors = FALSE)

# Load the server and ui
source("myui.R")
source("myserverd.R")

shinyApp(ui = ui, server = server)