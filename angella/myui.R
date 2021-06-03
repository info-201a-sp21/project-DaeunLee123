library("shiny")

ui <- fluidPage(
  titlePanel("Coronavirus Vaccinations Visual Data"),
  mainPanel(
    img(src = "covidvaccine.png", height = 50, width = 120),
    h1("Overview"),
    p("The purpose of this project is to visually display data regarding Coronavirus vaccinations. These visual representations allow viewers to easily detect patterns within the dataset, which may have not been seen from a datatable. Although many aspects of Coronavirus are important to track, data on vaccinations can indicate its effectiveness with slowing the spread of the virus and its devistating effects. The major questions regarding vaccinations that we will be answering and the source of data for each question include:", style = "font-family: 'Arial'; font-si16pt"),
    div("1. What is the trend of total vaccinations in the United States by date? (Source of data: Kaggle", style = "color:blue"),
    div("2. What is the trend of total vaccinations in the United States by state? (Source of data: project-DauenLee123/data/aggregated table.csv)", style = "color:blue"),
    div("3. What is the comparison between the number of people vaccinated vs. the total population, per state in the United States? (Source of data: Kaggle)", style = "color:blue"),
  )
)

page_two <- tabPanel(
  "Vaccinations by Date",
  
  
)

page_three <- tabPanel(
  "Vaccinations by State",
    
)

page_four <- tabPanel(
  "Percentage of Vaccinated Population by State",
  
)

page_five <- tabPanel(
  "Overview",
  h2("Takeaway #1"),
  p("A description of the notable data-insight or pattern discovered in your project"),
  p("A specific piece of data, table, or chart that demonstrates the pattern/insight"),
  p("The broader implications of the insight"),
  h2("Takeaway #2"),
  p("A description of the notable data-insight or pattern discovered in your project"),
  p("A specific piece of data, table, or chart that demonstrates the pattern/insight"),
  p("The broader implications of the insight"),
  h2("Takeaway #3"),
  p("A description of the notable data-insight or pattern discovered in your project"),
  p("A specific piece of data, table, or chart that demonstrates the pattern/insight"),
  p("The broader implications of the insight"),
)

ui <- navbarPage("Coronavirus Vaccinations Visual Data",
                 page_two,
                 page_three,
                 page_four,
                 page_five
                 
)