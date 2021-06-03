# Calling into the library
library("shiny")
library("lintr")
library("plotly")
library("ggplot2")
library("dplyr")
library("shinyWidgets")
source("pie_chart.R")
# Data set variables
vaccine <-
  read.csv("../data/us_state_vaccinations.csv", stringsAsFactors = FALSE)

# First page ui
page_one <- tabPanel(
  "Home Page",
  tags$style('.container-fluid {
                             background-color: #B0C4DE;
              }'),
  titlePanel("Coronavirus Vaccinations Visual Data"),
  mainPanel(
    tags$img(src = "covidvaccine.png", height = 350, width = 800),
    tags$h1("Overview"),
    tags$p("The purpose of this project is to visually display data regarding
    Coronavirus vaccinations. These visual representations allow viewers to
    easily detect patterns within the dataset, which may have not been seen from
    a datatable. Although many aspects of Coronavirus are important to track,
    data on vaccinations can indicate its effectiveness with slowing the spread
    of the virus and its devistating effects. The major questions regarding
    vaccinations that we will be answering and the source of data for each
    question include:", style = "font-family: 'Arial'; font-si16pt"),
    tags$p("1. What is the trend of total vaccinations in the United States by
    date?", style = "color:white"),
    tags$p("2. What is the trend of total vaccinations in the United States by 
    state?", style = "color:white"),
    tags$p("3. What is the comparison between the number of people vaccinated 
    vs. the total population, per state in the United States?", 
    style = "color:white"),
    tags$p("The source of data for the entirety of the project comes from", tags$a(
      href="https://www.kaggle.com/paultimothymooney/usa-covid19-vaccinations", 
           "Kaggle"), ". From this data set on vaccinations in the 
           United States, a new dataset was created that specifically addresses 
           the components of vaccinations that this project is analyzing."),
    align = "center")
)

# Second page ui
page_two <- tabPanel(
  "Vaccinations by Month",
  ui <- fluidPage(h1("Vaccines Distributed By Months"
  ),
  tags$h2("Introduction"
  ),
  tags$h5("What is the trend of total vaccinations in the United States
                   by date?"),
  tags$p("This chart attempts understand the relationship between time
                and the total number of vaccines distributed. In this case, we
                can further ask, does time and the number of
                  vaccines distributed have a direct correlation? I chose this
                  chart type to demonstrate the visuals for this question
                  because I thought that it did a good job showing users in what
                  ways the variables interacted with each other, especially
                  because one of the variables was time."
  ),
  tags$h2("Interactive Plot"
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
    outputId = "dateplot")
))


# Third page ui
page_three <- tabPanel(
  "Vaccinations by State",
  
)

# Fourth page ui
page_four <- tabPanel(
  "Percentage of Vaccinated Population by State",
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
)


# Last page ui
page_five <- tabPanel(
  "Conclusion",
  tags$h2("Takeaway #1"),
  tags$p("The total number of distributed vaccines rises from the start of the
  year, but starts to decline after April. This insight can be seen on the
    'Vaccinations by Date' page, on the interactive graph. The broader
    implications of this insight is that the majority of the United States
    received their vaccinations early on, as there were more resources and
    availability.", style = "font-family: 'Arial'; font-si16pt"),
  tags$h2("Takeaway #2"),
  tags$p("A description of the notable data-insight or pattern discovered in
  your project"),
  tags$p("A specific piece of data, table, or chart that demonstrates the
    pattern/insight"),
  tags$p("The broader implications of the insight", style = "font-family:
    'Arial'; font-si16pt"),
  tags$h2("Takeaway #3"),
  tags$p("The percentage of unvaccinated people is higher than vaccinated people
  in most states, as most states have 1/3 of their population vaccinated. This
  insight can be seen on the 'Percentage of Vaccinated Population by State'
  page, on the interactive pie chart. The broader implications of this insight
  suggest that people may struggle to get vaccinated due to lack of resources
  per state, or that certain populations within states do not want to be
  vaccinated.", style = "font-family: 'Arial'; font-si16pt")
)

ui <- navbarPage(theme = "style.css", "Coronavirus Vaccinations Visual Data",
                 page_one,
                 page_two,
                 page_three,
                 page_four,
                 page_five
)