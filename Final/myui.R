# Calling into the library
library("shiny")
library("lintr")
library("plotly")
library("shinyWidgets")

# Data set variables
rm(list = ls())
vaccine <-
  read.csv("../data/us_state_vaccinations.csv", stringsAsFactors = FALSE)

# First page ui
page_one <- tabPanel(
  "Home Page",
  setBackgroundColor("light blue"),
  titlePanel("Coronavirus Vaccinations Visual Data", align = "center"),
  mainPanel(
    tags$img(src = "covidvaccine.png", height = 50, width = 120),
    h1("Overview"),
    p("The purpose of this project is to visually display data regarding
    Coronavirus vaccinations. These visual representations allow viewers to
    easily detect patterns within the dataset, which may have not been seen from
    a datatable. Although many aspects of Coronavirus are important to track,
    data on vaccinations can indicate its effectiveness with slowing the spread
    of the virus and its devistating effects. The major questions regarding
    vaccinations that we will be answering and the source of data for each
    question include:", style = "font-family: 'Arial'; font-si16pt"),
    div("1. What is the trend of total vaccinations in the United States by
    date? (Source of data: Kaggle)", style = "color:blue"),
    div("2. What is the trend of total vaccinations in the United States by
    state? (Source of data: project-DauenLee123/data/aggregated table.csv)",
        style = "color:blue"),
    div("3. What is the comparison between the number of people vaccinated vs.
    the total population, per state in the United States?
        (Source of data: Kaggle)", style = "color:blue")
  )
)

# Second page ui
page_two <- tabPanel(
  "Vaccinations by Month",
  ui <- fluidPage(h1("Vaccines Distributed By Months"
  ),
  h2("Introduction"
  ),
  h5("What is the trend of total vaccinations in the United States
                   by date?"),
  p("This chart attempts understand the relationship between time
                and the total number of vaccines distributed. In this case, we
                can further ask, does time and the number of
                  vaccines distributed have a direct correlation? I chose this
                  chart type to demonstrate the visuals for this question
                  because I thought that it did a good job showing users in what
                  ways the variables interacted with each other, especially
                  because one of the variables was time."
  ),
  h2("Interactive Plot"
  ),

# Adding in the bar graph
  checkboxGroupInput(
    inputId = "month",
    label = h4("Choose a month:"),
    choices = c("January",
                "February",
                "March",
                "April",
                "May"),
    selected = c("January",
                 "February",
                 "March",
                 "April",
                 "May")),

  plotlyOutput(
    outputId = "dateplot")))

# Third page ui
page_three <- tabPanel(
  "Vaccinations by State",

)

# Fourth page ui
page_four <- tabPanel(
  "Percentage of Vaccinated Population by State",

)

# Last page ui
page_five <- tabPanel(
  "Overview",
  h2("Takeaway #1"),
  p("The total number of distributed vaccines rises from the start of the
  year, but starts to decline after April. This insight can be seen on the
    'Vaccinations by Date' page, on the interactive graph. The broader
    implications of this insight is that the majority of the United States
    received their vaccinations early on, as there were more resources and
    availability.", style = "font-family: 'Arial'; font-si16pt"),
  h2("Takeaway #2"),
  p("A description of the notable data-insight or pattern discovered in
  your project"),
  p("A specific piece of data, table, or chart that demonstrates the
    pattern/insight"),
  p("The broader implications of the insight", style = "font-family:
    'Arial'; font-si16pt"),
  h2("Takeaway #3"),
  p("The percentage of unvaccinated people is higher than vaccinated people
  in most states, as most states have 1/3 of their population vaccinated. This
  insight can be seen on the 'Percentage of Vaccinated Population by State'
  page, on the interactive pie chart. The broader implications of this insight
  suggest that people may struggle to get vaccinated due to lack of resources
  per state, or that certain populations within states do not want to be
  vaccinated.", style = "font-family: 'Arial'; font-si16pt")
)

ui <- navbarPage("Coronavirus Vaccinations Visual Data",
                 page_one,
                 page_two,
                 page_three,
                 page_four,
                 page_five
)