library(shiny)
library(leaflet)
library(geojsonio)
library(tidyverse)

murder_table <- readRDS("murders.RData")
geo <- geojson_read("us-states.json", what = "sp")
incident_per_state <- murder_table %>%
  group_by(State) %>%
  summarise(total_murders = n()) %>%
  filter(!row_number() %in% c(9))
geo@data <- left_join(geo@data, incident_per_state, by = c("name" = "State"))

location_data <- geo@data
