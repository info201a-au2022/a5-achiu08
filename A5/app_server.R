#Server loading 

library(ggplot2)
library(dplyr)
library(shiny)
library(plotly)

co2_data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")

netflix_imdb <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ag/main/data/n_movies.csv")
# How has CO2 emissions changed over time globally within the past 20 years?


# Vector of Countries 
co2_countries <- distinct(co2_change, country)

# Vector of years
co2_years <- distinct(co2_change, year)
  
# Running servers
server <- function(input, output){
  output$graph <- renderPlotly({
    co2_change <- co2_data %>% 
    filter(year >= input$year) %>% 
    group_by(country) %>% 
    filter(country == input$country) %>% 
    summarise(co2, country, year)
    
    co2_change_visualization <-ggplot(co2_change) +
      geom_col(mapping = (aes(x = year, y = co2, color= "088F8F"))) +
      labs(title = "Carbon Emissions Produced Over Time",
           x = "Year",
           y= "CO2 Produced",
            ) 
    return(co2_change_visualization)
  })}

    


 
  
 
 

  
  
