library(shiny)
library(tidyverse)
library(leaflet)

murder_table <- readRDS("murders.RData")

fluidPage(
  titlePanel("StateMap"), #Puts words stateMap on page
  mainPanel(
    leafletOutput(outputId = 'map', width = "100%", height = "100%") #Creates a map
  )
  
  
)

