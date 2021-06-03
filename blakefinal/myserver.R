server <- function(input, output) {
  output$piechart <- renderPlotly({
    piechart(input$state_choice)
  })
  
}