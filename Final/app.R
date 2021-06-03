# Calling the libraries
library("shiny")
library("lintr")
library("plotly")
library("ggplot2")
library("dplyr")
# Data set variables
vaccines <-
  read.csv("us_state_vaccinations.csv", stringsAsFactors = FALSE)
data <- read.csv("us-daily-covid-vaccine-doses-administered.csv")

# Load the server and ui
source("ui.R")
source("server.R")
source("pie_chart.R")

shinyApp(ui = ui, server = server)
