#load libraries
library("shiny")
library("ggplot2")

#import data
data <- read.csv("us-daily-covid-vaccine-doses-administered.csv")

ui <- fluidPage(h1("State Comparison of Total Vaccination Trend in 2021"),
                h2("Introduction"),
                h5("How can we visually compare each state's total vaccination
                   amount in the past months?"),
                p("The interactive graph enables the audience to make direct
                  comparisons between states' vaccination amount by selecting
                  and adding interested states and see their corresponding
                  linear graph over a period of time. This type of graph is
                  chosen because of its effectiveness and convience when making
                  comparisons and drawing conclusions. The intention of this
                  interactive page is to educate the public through
                  participating in searching and choosing in the widget."),
                h2("Interactive Graph"),
                selectizeInput(
                  inputId = "Entity", 
                  label = "Add or subtract states", 
                  choices = unique(data$Entity), 
                  selected = "Alabama",
                  multiple = TRUE
                ),
                plotlyOutput(outputId = "p")
              )