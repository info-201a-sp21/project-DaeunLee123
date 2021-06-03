# Calling the libraries
library("lintr")
library("plotly")
library("shiny")
library("dplyr")
library("ggplot2")
library("DT")

# Data set variables
vaccines <-
  read.csv("us_state_vaccinations.csv", stringsAsFactors = FALSE)
ata <- read.csv("us-daily-covid-vaccine-doses-administered.csv")
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
  
  monthly <- vaccines %>% mutate(month = format(as.Date(date, format =
                                                          "%Y-%m-%d"), "%B")) %>%
    filter(month %in% input$month) %>%
    group_by(month) %>%
    summarise(vaccines_month = sum(total_distributed, na.rm = TRUE))
    monthly$month <- factor(monthly$month, levels = c("January", "February",
                                                    "March", "April", "May"))
  

  output$table1 <- renderDataTable({
    datatable(
      monthly,
      colnames(table1) <- c("Month", "Total Number of Vaccinations Distributed")
    )
  })
}    