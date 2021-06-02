vaccines <-
  read.csv("../data/us_state_vaccinations.csv", stringsAsFactors = FALSE)
library("lintr")
library("plotly")
library("ggplot2")

vaccine1 <- vaccines %>% mutate(month = format(as.Date(vaccines$date, format = 
                                                         "%Y-%m-%d"), "%B")) %>%
  filter(month == vaccines$date)

server <- function(input, output) {
  output$dateplot <- renderPlotly({
  datechart <- plot_ly(
    data = vaccines,
    x = ~input$month,
    y = ~total_distributed,
    type = "scatter",
    mode = "markers"
  ) %>%
    layout(
      title = "Vaccines Distributed Per Month",
      xaxis = list(title = "Month"),
      yaxis = list(title = "Total Distributed Vaccines")
    )
  return(datechart)
  })
}
