library(shiny)
library(leaflet)
library(geojsonio)
library(tidyverse)
library(htmltools)
library(glue)

##Calling initial data and filtering data
source("murder_table.R")

##Calling coordinate data
source("coordinates.R")

##Calling state_function to summarize statistics for each state into the most common aspects of crimes 
source("state_function.R")


##Defining palette
qpal <- colorQuantile("Reds",
                geo@data$total_murders,
                n = 7)

##Drawing the map
function(input, output, session) {
  output$StateMap <- renderLeaflet({
    ##Joining geojson data with statistical data
    (geo@data <- left_join(geo@data,popup_data, by = c("NAME" = "State")))
    ##Formatting text for popups 
    (label_text <- glue(
      "<b>State: </b> {geo@data$NAME}<br/>",
      "<b>Total Murders: </b> {geo@data$total_murders}<br/>",
      "<b>Victim Age: </b> {geo@data$Common_Victim_Age}<br/>", 
      "<b>Victim Race: </b> {geo@data$Common_Victim_Race}<br/>",
      "<b>Victim Sex: </b> {geo@data$Common_Victim_Sex}<br/>",
      "<b>Relationship: </b> {geo@data$Common_Relationship}<br/>",
      "<b>Weapon: </b> {geo@data$Common_Weapon}<br/>",
      "<b>Perpetrator Age: </b> {geo@data$Common_Perpetrator_Age}<br/>",
      "<b>Perpetrator Race: </b> {geo@data$Common_Perpetrator_Race}<br/>",
      "<b>Perpetrator Sex: </b> {geo@data$Common_Perpetrator_Sex}<br/>"
    ) %>%
        lapply(htmltools::HTML))
    leaflet(geo) %>%
      setView(-96, 37.8, 4) %>%
    addPolygons(
      fillColor = ~qpal(total_murders),
      weight = 2,
      opacity = 1,
      color = "white",
      dashArray = "3",
      fillOpacity = 0.7) %>%
    addMarkers(lng = geo@data$longitude, 
               lat = geo@data$latitude, 
               popup = label_text) %>%
      addLegend("bottomright", 
                pal = qpal, 
                values = ~total_murders)
  })
  observe({
    leafletProxy("StateMap", data = murder_table)
  })
}



    
      

