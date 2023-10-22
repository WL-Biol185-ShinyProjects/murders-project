library(shiny)
library(tidyverse)
library(leaflet)

murder_table <- readRDS("murders.RData")

fluidPage(
  titlePanel("StateMap"),
  # mainPanel = mainPanel(plotOutput("StateMap")),
  leafletOutput("StateMap", width = "100%", height = "100%")
  )
<<<<<<< HEAD
)

=======
>>>>>>> d8da37a5a1c5b5204ac13e0a9ea91fd632a638a2
