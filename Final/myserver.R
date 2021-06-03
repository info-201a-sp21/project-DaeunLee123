# Calling the libraries
library("lintr")
library("plotly")
library("shiny")
library("dplyr")

# Data set variables
rm(list = ls())
vaccines <-
  read.csv("../data/us_state_vaccinations.csv", stringsAsFactors = FALSE)

# Vaccines by month function
server <- function(input, output) {
  output$dateplot <- renderPlotly({
    monthly <- vaccines %>% mutate(month = format(as.Date(date, format =
                                                 "%Y-%m-%d"), "%B")) %>%
      filter(month %in% input$month) %>%
    group_by(month) %>%
      summarise(vaccines_month = sum(total_distributed, na.rm = TRUE))
monthly$month <- factor(monthly$month, levels = c("January", "February",
                                                  "March", "April", "May"))

  datechart <- plot_ly(
    data = monthly,
    x = ~month,
    y = ~vaccines_month,
    type = "bar"
  ) %>%
    layout(
      title = "Vaccines Distributed Per Month",
      xaxis = list(title = "Month"),
      yaxis = list(title = "Total Distributed Vaccines"))
  return(datechart)
  })
}
