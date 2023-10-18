library(shiny)
library(tidyverse)
library(leaflet)

murder_table <- readRDS("murders.RData")

fluidPage(
<<<<<<< HEAD
  leafletOutput("StateMap"),
  titlePanel("State-Map"),
  sidebarLayout(
    sidebarPanel,
    mainPanel = mainPanel(plotOutput("StateMap"))
=======
<<<<<<< HEAD
  titlePanel("Murders"),
  
=======
  titlePanel("Murder Map"),
  leafletOutput("world_map"),
>>>>>>> 4ba11102e3e940a1f81cab36056bfa60d02f1b0b
  sidebarLayout(
    sidebarPanel (selectInput())
    mainPanel = mainPanel(plotOutput("##"))
>>>>>>> a38f4208a50fdcf2f43fb28bc295bc415c9ad3d2
  )
)
