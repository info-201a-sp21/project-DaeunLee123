library("ggplot2")
library("plotly")
source("script/aggregated_table.R")

chart_3 <- function(df) {
  chart_3 <- plot_ly(
    data = aggregated_table(df),
    x = ~population,
    y = ~mean_daily_vaccination,
    color = ~State,
    type = "scatter",
    mode = "markers"
  ) %>%
    layout(
      title = "Mean Daily Vaccination Trend",
      xaxis = list(title = "State Population", ticksuffix = "M"),
      yaxis = list(title = "Calculated Mean Daily Vaccination Amount",
                   ticksuffix = "Units")
    )
  return(chart_3)
}
