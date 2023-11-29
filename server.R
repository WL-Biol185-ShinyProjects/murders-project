library(shiny)
library(leaflet)
library(geojsonio)
library(tidyverse)
library(htmltools)
library(glue)

##Calling initial data and filtering data
source("murder_table.R")

##Calling state_function to summarize statistics for each state into the most common aspects of crimes 
source("state_function.R")

source("ggplots.R")

##Defining palette
qpal <- colorQuantile("Reds",
                popup_data$total_murders,
                n = 7)
#changed from murder_table to CENSUSAREA line 16 after $
#got an error of "memory allocation error"... memory.limit(100) possible fix ***ASK Whitworth 

##Drawing the map   
function(input, output, session) {
  output$StateMap <- renderLeaflet({
    ##Joining geojson data with statistical data
    (geo@data <- left_join(geo@data, filter(popup_data, input$range == Year), by = c("NAME" = "State")))
    geo@data<-(left_join( geo@data, popup_data, by = c("NAME" = "State"
                                                      )))
    (label_text <- glue(
      "<b>State: </b> {popup_data$State}<br/>",
      "<b>Total Murders: </b> {popup_data$total_murders}<br/>",
      "<b>Victim Age: </b> {popup_data$Common_Victim_Age}<br/>",
      "<b>Victim Race: </b> {Common_Victim_Race}<br/>",
      "<b>Victim Sex: </b> {Common_Victim_Sex}<br/>",
      "<b>Relationship: </b> {Common_Relationship}<br/>",
      "<b>Weapon: </b> {Common_Weapon}<br/>",
      "<b>Perpetrator Age: </b> {popup_data$Common_Perpetrator_Age}<br/>",
      "<b>Perpetrator Race: </b> {Common_Perpetrator_Race}<br/>",
      "<b>Perpetrator Sex: </b> {Common_Perpetrator_Sex}<br/>"
    ) %>%
        lapply(htmltools::HTML))
    
    leaflet(geo) %>%
      setView(-96, 37.8, 4) %>%
    addPolygons(
      fillColor = ~qpal(popup_data$total_murders),
      weight = 2,
      opacity = 1,
      color = "white",
      dashArray = "3",
      smoothFactor = 0.2,
      fillOpacity = 0.7) %>%
    addMarkers(lng = popup_data$longitude,
               lat = popup_data$latitude,
               popup = label_text) %>%
    addLegend("bottomright", 
              pal = qpal, 
              values = ~popup_data$total_murders)
     })
  
  output$scatterplot <- renderPlot({
    ggplot(murderbargraph, aes_string(input$Month, input$State)) + geom_point(stat = "identity")
  })
    
  output$racepiechart <- renderPlot({
    ggplot(victimrace, aes(x = "", y = victimrace$n, fill = victimrace$Victim.Race)) + 
      geom_bar(stat = "identity", width =1, color = "black") +
      coord_polar("y", start = 0) + theme_void() + scale_fill_discrete(name="Victim Race")
  })
  
  observe({
    input_data <- filter(popup_data, input$range == Year)
    geo@data <- left_join(original_data, input_data, by = c("NAME" = "State"))
    label_text <- glue(
        "<b>State: </b> {input_data$State}<br/>",
        "<b>Total Murders: </b> {input_data$total_murders}<br/>",
        "<b>Victim Age: </b> {input_data$Common_Victim_Age}<br/>",
        "<b>Victim Race: </b> {Common_Victim_Race}<br/>",
         "<b>Victim Sex: </b> {Common_Victim_Sex}<br/>",
        "<b>Relationship: </b> {Common_Relationship}<br/>",
        "<b>Weapon: </b> {Common_Weapon}<br/>",
         "<b>Perpetrator Age: </b> {input_data$Common_Perpetrator_Age}<br/>",
          "<b>Perpetrator Race: </b> {Common_Perpetrator_Race}<br/>",
          "<b>Perpetrator Sex: </b> {Common_Perpetrator_Sex}<br/>"
      %>%
      lapply(htmltools::HTML)
      )
    leafletProxy("StateMap", session) %>%
    clearMarkers() %>%
    addMarkers(lng = input_data$longitude,
               lat = input_data$latitude,
               popup = paste(label_text)
    )
  })
}

