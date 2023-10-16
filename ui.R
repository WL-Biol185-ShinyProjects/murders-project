library(shiny)
library(tidyverse)
library(leaflet)

##source
murder_table <- readRDS("murders.RData")

fluidPage(
  titlePanel("Murders"),
  
  sidebarLayout(
    sidebarPanel (selectInput())
    mainPanel = mainPanel(plotOutput("##"))
  )
)
