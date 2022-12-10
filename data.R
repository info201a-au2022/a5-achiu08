library(dplyr)
library(shiny)
library(ggplot2)

co2_data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")

# How has CO2 emissions changed over time in each country within the past 20 years?
CO2_change <- co2_data %>% 
  filter(year >= 2000) %>% 
  group_by(country) %>% 
  summarise(co2, year, country)

CO2_change_visual <- ggplot(CO2_change) +
  geom_col(mapping= aes(x = country, y = co2)) 

CO2_change_visual  



output$country <-renderUI( selectInput("select"),
                           label = "Select Country",
                           choices = co2_years,
                           return(co2_years(co2_change, input$select))
)}


year_slider <- sliderInput(
  selectInput("country",
              label = "Year Focus",
              min = "2000",
              max = "2021",
              selected = plotlyOutput(outputId = "graph"),
              return(co2_graph_page))
)

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