library(shiny)


function(input, output, session) {
  ##
  
  
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

