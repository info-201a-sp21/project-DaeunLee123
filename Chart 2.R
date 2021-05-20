library("plotly")
library("ggplot2")
library("dplyr")
library("tidyr")
population_vs_vaccination <- Aggregated_table %>%
  select(State, total_people_vaccinated, population) %>%
  gather( key = total_people_vaccinated, value = population, -State)

ggplot(population_vs_vaccination) +
  geom_col(mapping = aes(x = State, y = population, fill = total_people_vaccinated), position = "dodge")
