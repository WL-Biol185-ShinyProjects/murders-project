library(shiny)
library(tidyverse)
library(leaflet)

murder_table <- readRDS("murders.RData")

fluidPage(
  titlePanel("StateMap"),
  # mainPanel = mainPanel(plotOutput("StateMap")),
  leafletOutput("StateMap", width = "100%", height = "100%")
  )
