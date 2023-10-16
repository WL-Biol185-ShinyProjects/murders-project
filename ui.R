library(shiny)
library(tidyverse)

##source
murder_table <- readRDS("murders.RData")

fluidPage(
  titlePanel("Murder Map"),
  leafletOutput("world_map"),
  sidebarLayout(
    sidebarPanel,
    mainPanel = mainPanel(plotOutput("##"))
  )
)
