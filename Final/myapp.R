# Calling the libraries
library("shiny")
library("lintr")
library("plotly")
library("ggplot2")
library("dplyr")

# Data set variables
vaccines <-
  read.csv("../data/us_state_vaccinations.csv", stringsAsFactors = FALSE)

# Load the server and ui
source("myui.R")
source("myserver.R")

shinyApp(ui = ui, server = server)