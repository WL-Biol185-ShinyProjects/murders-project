library(shiny)
library(leaflet)
library(lubridate)


murder_table <- readRDS("murders.RData")

geo <- geojson_read("us-states.json", what = "sp")
joint_data <- left_join(geo@data, murder_table, by = c("NAME" = "State"))
joint_data %>% 
  filter()
  

function(input, output) {
  output$StateMap <- renderPlot({
    leaflet(geo) %>%
      addPolygons(fillColor = ~pal(State))
  })
}
