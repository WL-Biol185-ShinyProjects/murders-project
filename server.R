library(shiny)
library(leaflet)
library(geojsonio)
library(tidyverse)

murder_table <- readRDS("murders.RData")

geo <- geojson_read("us-states.json", what = "sp")
geo@data <- left_join(geo@data, murder_table, by = c("name" = "State"))


function(input, output, session) {
  output$StateMap <- renderLeaflet({
    leaflet(geo) %>%
      addTiles()
      # setView(-96, 37.8, 4) %>%
      # addProviderTiles(providers$CartoDB.Positron
    
      # input$date and others are Date objects. When outputting
      # text, we need to convert to character; otherwise it will
      # print an integer rather than a date.
    output$dateText  <- renderText({
      paste("input$date is", as.character(input$date))
      })
      
    output$dateText2 <- renderText({
      paste("input$date2 is", as.character(input$date2))
      })
      
    output$dateRangeText  <- renderText({
      paste("input$dateRange is", 
      paste(as.character(input$dateRange), collapse = " to ")
        )
      })
      
    output$dateRangeText2 <- renderText({
      paste("input$dateRange2 is", 
      paste(as.character(input$dateRange2), collapse = " to ")
        )
      })
    })
}


#incident_per_state <- murder_table %>% 
#  group_by(State) %>%
#  summarise(total_murders = n()) %>%
#  filter(!row_number() %in% c(9))

#data table with number of murders per state

