library(dplyr)
library(lintr)
source("script/aggregated_table.R")

# Summary Info
summary_info <- function(agtable) {
  # Mean population in U.S
  mean_population <- mean(aggregated_table(agtable)$population)

  # Mean total people vaccinated in the U.S
  mean_total_pplvac <- mean(aggregated_table(agtable)$total_people_vaccinated)

  # U.S average percentage of vaccinated people
  avg_percent_pplpop <- mean_total_pplvac / mean_population

  # Mean total vaccinations
  mean_total_vac <- mean(agtable$total_vaccinations)

  # Percentage of people vaccinated vs. vaccinations
  avg_percent_pplvac <- mean_total_pplvac / mean_total_vac

  # Creating and returning the list
  listed_summary <- list(mean_population, mean_total_pplvac,
                         avg_percent_pplpop, mean_total_vac, avg_percent_pplvac)
  return(listed_summary)
}