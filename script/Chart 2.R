library("plotly")
library("ggplot2")
library("dplyr")
library("tidyr")

chart_2 <- function(df) {
  population_vs_vaccination <- aggregated_table(df) %>%
    select(State, total_people_vaccinated, population) %>%
    gather(key = total_people_vaccinated, value = population, -State)
  
  chart_2 <- ggplot(population_vs_vaccination) +
    geom_col(mapping = aes(x = State, y = population,
                           fill = total_people_vaccinated),
             position = "dodge") +
    coord_flip() +
    scale_fill_discrete(name = "People Vaccinated Vs. Population",
                        labels = c("Population", "Total People Vaccinated")) +
    labs(x = "State", y = "Population")
  return(chart_2)
}