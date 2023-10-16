library(shiny)
library(tidyverse)
library(leaflet)

##source
murder_table <- readRDS("murders.RData")

fluidPage(
<<<<<<< HEAD
  titlePanel("Murders"),
  
=======
  titlePanel("Murder Map"),
  leafletOutput("world_map"),
>>>>>>> 4ba11102e3e940a1f81cab36056bfa60d02f1b0b
  sidebarLayout(
    sidebarPanel (selectInput())
    mainPanel = mainPanel(plotOutput("##"))
  )
)
