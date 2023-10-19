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

#incident_per_state <- murder_table %>% 
#  group_by(State) %>%
#  summarise(total_murders = n()) %>%
#  filter(!row_number() %in% c(9))

#data table with number of murders per state. Tried to run in geo and app
#crashed