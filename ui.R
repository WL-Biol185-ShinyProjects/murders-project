library(shiny)
library(tidyverse)

##source
murder_table <- readRDS("murders.RData")

fluidPage(
  titlePanel("Murder Map"),
  
  sidebarLayout(
    sidebarPanel,
    mainPanel = mainPanel(plotOutput("##"))
  )
)
