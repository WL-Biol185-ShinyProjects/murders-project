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
# 
# ##Formatting text for popups 
# label_text <- glue(
#   "<b>State: </b> {geo@data$NAME}<br/>",
#   "<b>Total Murders: </b> {geo@data$total_murders}<br/>",
#   "<b>Victim Age: </b> {geo@data$Common_Victim_Age}<br/>", 
#   "<b>Victim Race: </b> {geo@data$Common_Victim_Race}<br/>",
#   "<b>Victim Sex: </b> {geo@data$Common_Victim_Sex}<br/>",
#   "<b>Relationship: </b> {geo@data$Common_Relationship}<br/>",
#   "<b>Weapon: </b> {geo@data$Common_Weapon}<br/>",
#   "<b>Perpetrator Age: </b> {geo@data$Common_Perpetrator_Age}<br/>",
#   "<b>Perpetrator Race: </b> {geo@data$Common_Perpetrator_Race}<br/>",
#   "<b>Perpetrator Sex: </b> {geo@data$Common_Perpetrator_Sex}<br/>"
# ) %>%
#   lapply(htmltools::HTML)

##Drawing the map    
##Joining geojson data with statistical data
originalData <- geo@data


function(input, output, session) {
  output$StateMap <- renderLeaflet({
    ##Joining geojson data with statistical data
    (geo@data <- left_join(geo@data, filter(popup_data, Year == input$Year), by = c("NAME" = "State")))
    print("leaflet") %>%
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
      smoothFactor = 0.2,
      fillOpacity = 0.7) %>%
    addMarkers(lng = geo@data$lon, 
               lat = geo@data$lat, 
               popup = label_text,
               NULL = FALSE) %>%
    addLegend("bottomright", 
              pal = qpal, 
              values = ~total_murders)
     })
  # observe({
  # leafletProxy("StateMap", data = popup_data)%>% 
  #   addMarkers(lng = geo@data$longitude,
  #              lat = geo@data$latitude,
  #              popup = ~label_text) %>%
  #   addLegend("bottomright",
  #             pal = qpal,
  #             values = ~total_murders) %>% 
  #     fitBounds(~min(geo@data$longitude), ~min(geo@data$latitude), ~max(geo@data$longitude), ~max(geo@data$latitude))
  # })
  observe({
    geo@data <- left_join(originalData, filter(popup_data, Year == input$Year))
    leafletProxy(data= geo) %>%
      # ("StateMap", data = filteredData()) %>%
      clearShapes() %>%
      clearPopups() %>%
      clearMarkers() %>%
      # (label_text <- glue(
      #   "<b>State: </b> {filteredData$NAME}<br/>",
      #   "<b>Total Murders: </b> {filteredData$total_murders}<br/>",
      #   "<b>Victim Age: </b> {filteredData$Common_Victim_Age}<br/>", 
      #   "<b>Victim Race: </b> {filteredData$Common_Victim_Race}<br/>",
      #   "<b>Victim Sex: </b> {filteredData$Common_Victim_Sex}<br/>",
      #   "<b>Relationship: </b> {filteredData$Common_Relationship}<br/>",
      #   "<b>Weapon: </b> {filteredData$Common_Weapon}<br/>",
      #   "<b>Perpetrator Age: </b> {filteredData$Common_Perpetrator_Age}<br/>",
      #   "<b>Perpetrator Race: </b> {filteredData$Common_Perpetrator_Race}<br/>",
      #   "<b>Perpetrator Sex: </b> {filteredData$Common_Perpetrator_Sex}<br/>"
      # ) %>%
      #   lapply(htmltools::HTML))
      addMarkers(lng = popup_data$longitude,
                 lat = popup_data$latitude,
                 # popup = label_text
                 )
    
  })
}

