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
  
  #Subsitute dataname before $ then column name after
  output$map <- renderLeaflet({ #Creating the map
    murderColorGradient <- colorNumeric("Reds", domain=DATANAME$COLUMNANAME) #Sets variable that assigns colors of red, heavier red = more murders. Use data name $ column name of the murders
    leaflet(data= murderDataCHANGE) #Where data goes when you make it
    addTiles() %>% #Makes map theme
      setView(0, 40, zoom =4) %>% #Sets zoom doesnt matter 
      
      addPolygons( 
        fillColor = ~murderColorGradient(DATANAE$COLNAME), 
        fillOpacity = 0.7, #Play with these as needed
        weight = 0.2, 
        smoothFactor = 0.2) %>%
      addMarkers(
        lng = ~Longitude,
        lat = ~Latitude,
        label = finalDogData$Breed,
        
      )
  })
}


#incident_per_state <- murder_table %>% 
#  group_by(State) %>%
#  summarise(total_murders = n()) %>%
#  filter(!row_number() %in% c(9))

#data table with number of murders per state

