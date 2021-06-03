#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
source("script/pie_chart.R")
library(shiny)
ui <- fluidPage(
    selectInput("state_choice", "States", choices = df$State, selected = NULL),
    plotlyOutput("piechart")
)


server <- function(input, output) {
    output$piechart <- renderPlotly({
        piechart(input$state_choice)
    })
    
}
shinyApp(ui = ui, server = server)
