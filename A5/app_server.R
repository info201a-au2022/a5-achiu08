#Server loading 

library(ggplot2)
library(dplyr)
library(shiny)
library(plotly)

co2_data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")

netflix_imdb <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ag/main/data/n_movies.csv")
# How has CO2 emissions changed over time globally within the past 20 years?
co2_graph <- function(input, output){
  co2_change <- co2_data %>% 
    filter(year >= 2000) %>% 
    group_by(country) %>% 
    summarise(co2, country, year)
    
  co2_change_visualization <-ggplot(co2_change) +
    geom_col(mapping = (aes(x = year, y = co2))) +
    labs(title = "CO2 Change Over Time",
         x = "CO2 Produced",
         y= "Year")
  
  co2_change_visualization
}
# Vector of Countries 
co2_countries <- distinct(co2_change, country)

# Vector of years
co2_years <- distinct(co2_change, year)
  
# Running servers
server <- function(input, output){
  output$graph <- renderPlotly({
    return(co2_graph(co2_change, input$country))
  })}
    


 
  
 
 

  
  
