library(shiny)
library(tidyverse)
library(leaflet)
library(stringr)
library(geojsonio)

murder_table <- readRDS("murders.RData")
##Calling initial data and filtering data
source("murder_table.R")

##Calling state_function to summarize statistics for each state into the most common aspects of crimes 
source("state_function.R")

bootstrapPage(
  titlePanel("State Map"), 
  mainPanel(leafletOutput("StateMap"),
            sliderInput("range","Year",min=1980,max=2014, value = range(popup_data$Year), step = 1),
            checkboxInput("legend", "Show legend", TRUE))
  )
