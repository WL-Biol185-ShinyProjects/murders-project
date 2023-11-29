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
    ggplot(murderline, aes(x= Year, y = total_murders)) + 
      geom_point(shape=24, fill = "darkturquoise", color = "darkturquoise", size=3) +
      geom_smooth(method=lm, color = "red") +
      scale_x_continuous(breaks = c(1980, 1985, 1990, 1995, 2000, 2005, 2010)) +
      ylab("Murder Incidence") +
      xlab("Year") +
      ggtitle("Murder Incidence Through the Years")
      })

  
    output$barplot <- renderPlot({    
      ggplot(murderbargraph2, aes(x = Month, y = monthly_murders, fill = Month)) + 
      geom_bar(stat = 'identity', alpha=0.5) + 
      ylab("Murder Incidence") +
      xlab("Month") + 
      ggtitle("Murder Incidence by State and Year")
  })
  
    
  output$racepiechart <- renderPlot({
    ggplot(victimrace, aes(x = "", y = victimrace$n, fill = victimrace$Victim.Race)) + 
      geom_bar(stat = "identity", width =1, color = "black") +
      coord_polar("y", start = 0) + theme_void() + scale_fill_discrete(name="Victim Race")
  })
  
  output$weaponpiechart <- renderPlot({
    ggplot(common_table_weapon, aes(x = "", y = common_table_weapon$n, fill = common_table_weapon$Weapon)) + 
      geom_bar(stat = "identity", width =1, color = "black", alpha=0.7) +
      coord_polar("y", start = 0) + theme_void() + 
      scale_fill_manual("Weapon Type", values = c("Handgun" = "deeppink", 
                                             "Knife" = "brown", 
                                             "Blunt Object" = "red",
                                             "Firearm" = "blueviolet", 
                                             "Unknown" = "darksalmon", 
                                             "Shotgun" = "darkmagenta",
                                             "Rifle" = "darkolivegreen1",
                                             "Strangulation" = "darkgoldenrod1",
                                             "Fire" = "darkgreen",
                                             "Suffocation" = "deepskyblue",
                                             "Gun" = "cadetblue1", 
                                             "Drugs" = "cornsilk",
                                             "Drowning" = "green", 
                                             "Explosives" = "pink",
                                             "Poison" = "coral1",
                                             "Fall" = "yellow"
                                             
      ))
    
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
  
  
  # observe({
  #   input_bargraph <- filter(murderbargraph2, input$Year == Year, input$State == State)
    
  })
}

