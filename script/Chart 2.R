library("plotly")
library("ggplot2")
library("dplyr")
library("tidyr")
source("script/aggregated_table.R")

chart_2 <- function(df){
population_vs_vaccination <- aggregated_table(df) %>%
  select(State, total_people_vaccinated, population) %>%
  gather( key = total_people_vaccinated, value = population, -State)

ggplot(population_vs_vaccination) +
  geom_col(mapping = aes(x = State, y = population, fill = total_people_vaccinated), position = "dodge")
}

