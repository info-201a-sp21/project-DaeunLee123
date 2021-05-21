library("plotly")
library("ggplot2")
library("dplyr")
library("tidyr")
source("script/aggregated_table.R")

chart_2 <- function(df) {
population_vs_vaccination <- aggregated_table(df) %>%
  select(State, total_people_vaccinated, population) %>%
  gather(key = total_people_vaccinated, value = population, -State) %>%

chart_2 <- ggplot(population_vs_vaccination) +
  geom_col(mapping = aes(x = State, y = Population, fill =
                           total_people_vaccinated), position = "dodge") +
  coord_flip() +
  lab(x = "State", y = "Population", fill = "Total People Vaccinated")

return(chart_2)
}
