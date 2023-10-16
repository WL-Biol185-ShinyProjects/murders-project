# murders-project
Analysis of homicide rates and convictions

library(leaflet)
library(geojsonio)
library(tidyverse)

geo <- geojson_read("us-states.json", what = "sp")

geo@data <- left_join(geo@data, myTable, by = c("NAME" = "State"))

geo@data <- mutate(geo@data, value = sample(1:100, nrow(geo@data)))

pal <- colorBin("YlOrRd", domain = geo@data$value)

leaflet(geo) %>%
  addPolygons(fillColor = ~pal(value))

data1 <- read.csv("data-murders.csv")

