ui <- fluidPage(
  h1("Percentage of Vaccinated People and Unvaccinated People by States"),
  h2("Introduction"),
  h5("What is the percentage of vaccinated people of each state?"),
  p("This chart shows the percentage of vaccinated people and unvaccinated 
    people of each state until May 9th, 2021. This chart can help people to 
    see the progress of Covid-19 vaccination"),
  h2("Pie Chart"),
  selectInput("state_choice", "States", choices = df$State, selected = NULL),
  plotlyOutput("piechart")
)