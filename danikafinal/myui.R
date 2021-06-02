vaccine <-
  read.csv("../data/us_state_vaccinations.csv", stringsAsFactors = FALSE)
library("lintr")
library("plotly")
library("ggplot2")

ui <- fluidPage(h1("Vaccination Interactive Page"
                   ),
                h2("Introduction"
                   ),
                p("This chart tries to attempt understand..."
                  ),
                p("Question raised, why I chose the chart"
                  ),
                h2("Interactive Plot"
                   ),
                selectInput(
                  inputId="month",
                  label = h4("Choose a month:"),
                  choices = c("January",
                    "February",
                    "March",
                    "April",
                    "May",
                    "June",
                    "July",
                    "August",
                    "September",
                    "October",
                    "November",
                    "December"),
                  selected = "January",
                ),
                
                plotlyOutput(
                  outputId = "dateplot"
                )
       )