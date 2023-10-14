library(shiny)
library(tidyverse)

##source

fluidPage(
  titlePanel("Murder Map"),
  
  sidebarLayout(
    sidebarPanel,
    mainPanel = mainPanel(plotOutput("##"))
  )
)
