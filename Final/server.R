# Calling the libraries
library("lintr")
library("plotly")
library("shiny")
library("dplyr")
library("ggplot2")
library("DT")

# Data set variables
vaccines <- na.omit(read.csv("us_state_vaccinations.csv", stringsAsFactors = FALSE))
df <- read.csv("Aggregated table.csv")
data <- as.data.frame(read.csv("us-daily-covid-vaccine-doses-administered.csv"))
# Vaccines by month function
server <- function(input, output) {
  output$dateplot <- renderPlotly({
    monthly <- vaccines %>% mutate(month = format(as.Date(date, format =
                                                 "%Y-%m-%d"), "%B")) %>%
      filter(month %in% input$month) %>%
    group_by(month) %>%
      summarise(vaccines_month = sum(total_distributed, na.rm = TRUE))
monthly$month <- factor(monthly$month, levels = c("January", "February",
                                                  "March", "April", "May"))

  datechart <- plot_ly(
    data = monthly,
    x = ~month,
    y = ~vaccines_month,
    type = "bar"
  ) %>%
    layout(
      title = "Vaccines Distributed Per Month",
      xaxis = list(title = "Month"),
      yaxis = list(title = "Total Distributed Vaccines"))
  return(datechart)
  })


# Vaccination amount by state

  output$p <- renderPlotly({
  plot_ly(data, x = ~Day, y = ~daily_vaccinations) %>%
      filter(Entity %in% input$Entity) %>%
      group_by(Entity) %>%
      add_lines()
  }) 

# Vaccine percentage by state

  output$piechart <- renderPlotly({
    piechart(input$state_choice)
  })

# Vaccines by month table for insight

  output$table1 <- DT::renderDataTable({
    x <- c("January", "February", "March", "April", "May")
    cnames <- c("Month", "Total Number of Vaccinations Distributed")
    monthly <- vaccines %>% mutate(month = format(as.Date(date, format = 
                                                            "%Y-%m-%d"), "%B")) %>%
      group_by(month) %>%
      summarise(vaccines_month = sum(total_distributed, na.rm = TRUE)) %>%
      slice(match(x, month))
    colnames(monthly) <- cnames
    return(monthly)
  })
  
# Vaccines by state table for insight
  
  statetable_df <- data %>% filter(Entity %in% c("Arkansas", "Washington"))
  
  output$table2 <- DT::renderDataTable({
    x <- c("Arkansas", "Washington")
    cnames <- c("State", "Date", "Total Vaccinations")
    date <- statetable_df %>% filter(Day %in% c("2021-01-13", "2021-06-02")) %>%
      group_by(Day) %>% 
      slice(match(x, Entity))
    colnames(date) <- cnames
    return(date)
  })
  
# Vaccinated population table for insight
  output$table3 <- DT::renderDataTable({
    table3 <- df %>%
      group_by(State) %>%
      summarise(percentage = round(100*(total_people_vaccinated/population), 1))
    return(table3)
  })
}    
  




