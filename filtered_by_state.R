library(shiny)
library(leaflet)
library(geojsonio)
library(tidyverse)

Alabama <- murder_table %>%
  filter(State == "Alabama")

Alabama_weapon <- Alabama[, -c(2:12)] 
  names(which.max(table(Alabama_weapon$Weapon)))

