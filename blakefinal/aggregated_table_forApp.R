library("dplyr")

# group by location
# sorted descending by total_vaccinations
aggregated_table <- function(dataframe) {
  raw_population_df <- read.csv("../data/csvData.csv",
                                fileEncoding = "UCS-2LE",
                                check.names = F)

  colnames(dataframe)[2] <- "State"

  keeps <- c("State", "Pop")
  population_df <- raw_population_df[keeps]
  df <- merge(dataframe, population_df, by = "State")

table <- df %>%
  group_by(State) %>%
  summarise(
            total_vaccinations = max(total_vaccinations),
            total_distributed = max(total_distributed),
            total_people_vaccinated = max(people_vaccinated),
            mean_daily_vaccination = round(mean(daily_vaccinations), 0),
            population = mean(Pop)
            ) %>%
  arrange(desc(total_vaccinations))
return(table)
}