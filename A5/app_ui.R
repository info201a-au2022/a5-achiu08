
library(ggplot2)
library(dplyr)
library(shiny)
library(plotly)

co2_data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")

# Intro Page
intro_page <- tabPanel(
  "Introduction",
  h2("Introduction"),
  p(em("Alex Chiu A5 INFO 201 12/9/2022")),
  p("These past few months in Seattle, were the most concerning months of climate change for me. My birthday was at the beginning of October and for the first time in my life, I had a birthday that had sunny weather and 70 degree heat. This was one of the most obvious events of climate change and CO2 emissions are a contributing factor. In this report, I decided to analyze how the total carbon emissions produced by each country has changed over time. By visualizing the differences in carbon emissions in each country, we can use this data to see trends to determine what needs to be done about combating global warming. Trends can vary. For example, we can analyze the differences in emissions of low-income countries compared to high- income countries based on this analysis.")
,
  )

# CO2 Change Page
co2_graph_page <- mainPanel(
  plotlyOutput(outputId = "graph"))

co2_dropdown <- sidebarPanel(
  selectInput("country",
  label = "Select Country",
  choices = unique(co2_change$country),
  selected = "United States"
),
sliderInput("year",
            label = "Year Focus",
            min= 2000,
            max= 2021,
            value= 2000)
)


change_page <- tabPanel(
  "Change of CO2 Over time",
  p("This bar graph represents total carbon emissions produced by each country over a twenty year period. From 2000 to 2021. As seen in the various graphs, carbon emissions have increased as time goes on. What’s interesting is that the U.S has a slight decrease in carbon emissions while other countries have seen a steady increase such as Iran. Overall, the growing trends of carbon emissions should be an indicator that everyone should be actively involved in preventing excess carbon emissions."),
 sidebarLayout(
   co2_graph_page,
   co2_dropdown
))


# UI
ui <- navbarPage(
  title = "Analyzing CO2 Trends",
  intro_page,
  change_page
) 

                
 

  