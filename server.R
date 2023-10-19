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

<<<<<<< HEAD
#incident_per_state <- murder_table %>% 
#  group_by(State) %>%
#  summarise(total_murders = n()) %>%
#  filter(!row_number() %in% c(9))

#data table with number of murders per state. Tried to run in geo and app
#crashed
=======

>>>>>>> 9368bd3f96668b5fabd8b69fa347fab0727312aa
