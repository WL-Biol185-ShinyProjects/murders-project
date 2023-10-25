library(shiny)
library(leaflet)
library(geojsonio)
library(tidyverse)

Alabama <- murder_table %>%
  filter(State == "Alabama")
  # summarise(total_murders = n()) %>%

Alabama_weapon <- Alabama[, -c(2:12)] 
  common_weapon <- unique(Alabama_weapon$Weapon, incomparables = FALSE)
  print(common_weapon)
