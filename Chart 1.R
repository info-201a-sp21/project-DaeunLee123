library("plotly")
library("ggplot2")
chart_1 <- plot_ly(
  data = Aggregated_table,
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
