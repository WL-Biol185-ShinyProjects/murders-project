library(shiny)
library(tidyverse)
library(leaflet)

murder_table <- readRDS("murders.RData")

fluidPage(
  leafletOutput("StateMap"),
  titlePanel("State-Map"),
  sidebarLayout(
    sidebarPanel,
    mainPanel = mainPanel(plotOutput("StateMap"))
  )
)
