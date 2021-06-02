vaccine <-
  read.csv("../data/us_state_vaccinations.csv", stringsAsFactors = FALSE)
library("lintr")
library("plotly")
library("ggplot2")

ui <- fluidPage(h1("Vaccination Interactive Page"
                   ),
                h2("Introduction"
                   ),
                h5("What is the trend of total vaccinations in the United States
                   by date?"),
                p("This chart attempts understand the relationship between time
                and the total number of vaccines distributed. In this case, we
                can further ask, does time and the number of
                  vaccines distributed have a direct correlation? I chose this
                  chart type to demonstrate the visuals for this question
                  because I thought that it did a good job showing users in what
                  ways the variables interacted with each other, especially
                  because one of the variables was time."
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