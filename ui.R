library(shiny)
library(tidyverse)
library(leaflet)

murder_table <- readRDS("murders.RData")

bootstrapPage(
  titlePanel("State Map"), 
  mainPanel(leafletOutput("StateMap"),
            sliderInput("range","Year",min(popup_data$Year),max(popup_data$Year), value = range(popup_data$Year), step = 1),
            checkboxInput("legend", "Show legend", TRUE))
  )
