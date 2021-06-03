#load libraries
library("shiny")
library("ggplot2")

#import data
data <- read.csv("us-daily-covid-vaccine-doses-administered.csv")

server <- function(input, output, ...) {
  output$p <- renderPlotly({
    plot_ly(data, x = ~Day, y = ~daily_vaccinations) %>%
      filter(Entity %in% input$Entity) %>%
      group_by(Entity) %>%
      add_lines()
  })
}