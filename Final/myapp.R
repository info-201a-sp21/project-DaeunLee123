# Calling the libraries
library("shiny")
library("lintr")
library("plotly")
library("ggplot2")
library("dplyr")
# Data set variables
vaccines <-
  read.csv("../data/us_state_vaccinations.csv", stringsAsFactors = FALSE)
data <- read.csv("../shunshunfinal/us-daily-covid-vaccine-doses-administered.csv")

# Load the server and ui
source("myui.R")
source("myserver.R")
source("app_ui.R")
source("app_server.R")
source("pie_chart.R")

shinyApp(ui = ui, server = server)
