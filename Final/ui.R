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
  read.csv("us_state_vaccinations.csv", stringsAsFactors = FALSE)
data <- as.data.frame(read.csv("us-daily-covid-vaccine-doses-administered.csv"))

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
    vaccinations that we will be answering include:", 
    style = "font-family: 'Arial'; font-si16pt"),
    tags$p("1. What is the trend of total vaccinations in the United States by
    date?", style = "color:white"),
    tags$p("2. What is the trend of total vaccinations in the United States by 
    state?", style = "color:white"),
    tags$p("3. What is the comparison between the number of people vaccinated 
    vs. the total population, per state in the United States?", 
    style = "color:white"),
    tags$p("The source of data for the entirety of the project comes from", tags$a(
      href="https://www.kaggle.com/paultimothymooney/usa-covid19-vaccinations", 
           "Kaggle"), "and is created by Paul Mooney. This set of data on 
           vaccinations in the United States was used to create a new dataset 
           that specifically addresses the components of vaccinations that this 
           project is analyzing. The data of each component is updated at
            different dates, and the most updated date for each visualization
          will be listed in the description.")
    )
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
                and the total number of vaccines distributed, up to the date May
                31, 2021. Using this data, we can further ask, 'does time and 
                the number of vaccines distributed have a direct correlation?'
                This chart type was chosen to demonstrate the visuals for this 
                question because it effectively shows users in what
                ways the variables interacted with each other, which is 
                especially important as one of the variables is time."
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
  ui <- fluidPage(h1("State Comparison of Total Vaccination Trend in 2021"),
                h2("Introduction"),
                h5("How can we visually compare each state's total vaccination
                   amount in the past months?"),
                p("The interactive graph enables the audience to make direct
                  comparisons between states' daily vaccination rates by 
                  selecting desired states and seeing its corresponding
                  linear graph through the date May 31, 2021. This type of graph
                  was chosen because of its visual ease and convience when 
                  making comparisons to draw conclusions. The intention of this
                  interactive page is to inform the public on daily vaccination
                  rates through participation in searching and choosing specific
                  states using the widget."),
                h2("Interactive Graph"),
                selectizeInput(
                  inputId = "Entity", 
                  label = "Add or subtract states", 
                  choices = unique(data$Entity), 
                  selected = "Alabama",
                  multiple = TRUE
                ),
                plotlyOutput("p")
              )
)

# Fourth page ui
page_four <- tabPanel(
  "Percentage of Vaccinated Population by State",
  ui <- fluidPage(
    h1("Percentage of Vaccinated People and Unvaccinated People by States"),
    h2("Introduction"),
    h5("What is the percentage of vaccinated people of each state?"),
    p("This interactive chart displays the comparison of the vaccinated 
    and unvaccinated population of each state through the date of May 9th, 2021. 
    A pie chart was chosen to show this comparison, as it is an effective 
    communcattion tool by representing data visually as part-to-whole
    relationship. Additionally it provides the intended comparison in both
    percentages and population number, allowing the data to be interpretted in
    multiple ways. The comparison shown from this chart allows viewers to be
    informed of the vaccinated and unvaccinated populations in their desired 
    state, which can help determine vaccination distribution rates."),
    h2("Pie Chart"),
    selectInput("state_choice", "States", choices = df$State, selected = NULL),
    plotlyOutput("piechart")
  )
)


# Last page ui
page_five <- tabPanel(
  "Research Insights",
  ui <- fluidPage(
    tags$h2("Insight #1"),
    tags$p("The total number of distributed vaccines rises from the start of the
    year, but starts to decline after April. The broader implications of this 
    insight is that the majority of the United States received their vaccinations 
    early on, as there were more resources and availability. To prevent another
    spike of COVID-19 cases from occurring, vaccination distribution rates and
    availability should increase overtime.", 
    style = "font-family: 'Arial'; font-si16pt"),
    tags$h2("Insight #2"),
    tags$p("A description of the notable data-insight or pattern discovered in
  your project"),
    tags$p("A specific piece of data, table, or chart that demonstrates the
    pattern/insight"),
    tags$p("The broader implications of the insight", style = "font-family:
    'Arial'; font-si16pt"),
    tags$h2("Insight #3"),
    tags$p("The percentage of unvaccinated people is higher than vaccinated people
    in most states, as most states have 1/3 of their population vaccinated. This
    insight can be seen on the 'Percentage of Vaccinated Population by State'
    page, on the interactive pie chart. The broader implications of this insight
    suggest that people may struggle to get vaccinated due to lack of resources
    per state, or that certain populations within states do not want to be
    vaccinated.", style = "font-family: 'Arial'; font-si16pt")
  )
)
  
ui <- navbarPage(theme = "style.css", "Coronavirus Vaccinations Visual Data",
                 page_one,
                 page_two,
                 page_three,
                 page_four,
                 page_five
)
