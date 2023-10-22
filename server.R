library(shiny)
library(leaflet)
library(geojsonio)
library(tidyverse)

murder_table <- readRDS("murders.RData")

geo <- geojson_read("us-states.json", what = "sp")
geo@data <- left_join(geo@data, murder_table, by = c("name" = "State"))


function(input, output, session) {
  
 
  output$StateMap <- renderLeaflet({
 print("yay")
    leaflet(geo) %>%
      addTiles()
      # setView(-96, 37.8, 4) %>%
      # addProviderTiles(providers$CartoDB.Positron)
})
}


#incident_per_state <- murder_table %>% 
#  group_by(State) %>%
#  summarise(total_murders = n()) %>%
#  filter(!row_number() %in% c(9))

#data table with number of murders per state

