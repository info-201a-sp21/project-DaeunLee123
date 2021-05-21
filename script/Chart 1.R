library("plotly")
library("ggplot2")
source("script/aggregated_table.R")

chart_1 <- function(df) {
  chart_1 <- plot_ly(
    data = aggregated_table(df),
    x = ~State,
    y = ~total_people_vaccinated,
    type = "bar",
    alpha = .8,
    hovertext = "y"
  ) %>%
    layout(
      title = "Number of PeopleVaccinated per State",
      xaxis = list(title = "State"),
      yaxis = list(title = "Number of People Vaccinated")
    )
  return(chart_1)
}