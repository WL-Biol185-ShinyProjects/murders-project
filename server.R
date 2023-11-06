library(shiny)
library(leaflet)
library(geojsonio)
library(tidyverse)
library(htmltools)
library(glue)

murder_table <- readRDS("murders.RData")
geo <- geojson_read("states.geo.json", what = "sp")

incident_per_state <- murder_table %>%
  group_by(State) %>%
  summarise(total_murders = n()) %>%
  filter(!row_number() %in% c(52))

Coordinates <- read.csv("us-state-capitals.csv")

Coordinates$description <- NULL
popup_coordinates <- left_join(incident_per_state, Coordinates, c("State" = "name"))

source("state_function.R")

geo@data <- left_join(geo@data, popup_data, by = c("NAME" = "State"))

bins <- c(10,20,50,100,200,500,1000, Inf)

pal <- colorBin("YlOrRd", domain = geo@data$total_murders, bins = bins)

label_text <- glue(
  "<b>State: </b> {geo@data$NAME}<br/>",
  "<b>Victim Age: </b> {geo@data$Common_Victim_Age}<br/>", 
  "<b>Victim Race: </b> {geo@data$Common_Victim_Race}<br/>",
  "<b>Victim Sex: </b> {geo@data$Common_Victim_Sex}<br/>",
  "<b>Relationship: </b> {geo@data$Common_Relationship}<br/>",
  "<b>Weapon: </b> {geo@data$Common_Weapon}<br/>",
  "<b>Perpetrator Age: </b> {geo@data$Common_Perpetrator_Age}<br/>",
  "<b>Perpetrator Race: </b> {geo@data$Common_Perpetrator_Race}<br/>",
  "<b>Perpetrator Sex: </b> {geo@data$Common_Perpetrator_Sex}<br/>"
) %>%
  lapply(htmltools::HTML)


function(input, output, session) {
  output$StateMap <- renderLeaflet({
    leaflet(geo) %>%
      print("leaflet") %>%
      setView(-96, 37.8, 4) %>%
    addPolygons(
      fillColor = ~pal(total_murders),
      weight = 2,
      opacity = 1,
      color = "white",
      dashArray = "3",
      fillOpacity = 0.7) %>%
    addMarkers(lng = geo@data$longitude, lat = geo@data$latitude, popup = label_text) %>%
    addLegend("bottomright", 
              pal = pal, 
              values = ~total_murders)
    # addCircleMarkers(
    #   radius=~total_murders, color=~pal(type), stroke=FALSE, fillOpacity= 0.5
    # )
      
  })
}

# ~htmlEscape(c(geo@data$NAME, geo@data$Common_Perpetrator_Age))
     