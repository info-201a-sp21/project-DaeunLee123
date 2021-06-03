library(dplyr)
library(ggplot2)
library(plotly)
df <- read.csv("Aggregated table.csv")
df$unvaccinated <- df$population - df$total_people_vaccinated
piechart <- function(state) {
test <- filter(df, State == state)
test <- test[, c("total_people_vaccinated", "unvaccinated")]
category <- c("vaccinated", "unvaccinated")
value <- c(test[["total_people_vaccinated"]], test[["unvaccinated"]])
data <- data.frame(category, value)
fig <- plot_ly(test, labels = ~category, values = ~value, type = 'pie')
fig <- fig %>% layout(title = paste('Percentage of vaccinated people and unvaccinated people',
                                    "of",
                                    state),
                      xaxis = list(showgrid = FALSE, zeroline = FALSE,
                                   showticklabels = FALSE),
                      yaxis = list(showgrid = FALSE, zeroline = FALSE,
                                   showticklabels = FALSE))
return(fig)
}