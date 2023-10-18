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


