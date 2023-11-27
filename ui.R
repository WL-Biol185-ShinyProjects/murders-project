library(shiny)
library(tidyverse)
library(leaflet)
library(stringr)
library(geojsonio)

navbarPage("Murder Rates by State", id = "nav",
           tabPanel("welcome",div(class = "outer"),
                    tags$h2("This map summarizes data of US murder rates by state across selected years from 1980 to 2010")),
           tabPanel("State Map"), 
             mainPanel(leafletOutput("StateMap"),
                       sliderInput("range","Year", min=1980, max=2014, value = c(1980,2014), step = 1),
                       checkboxInput("legend", "Show legend", TRUE))
           )

murder_table <- readRDS("murders.RData")
##Calling initial data and filtering data
source("murder_table.R")

##Calling state_function to summarize statistics for each state into the most common aspects of crimes 
source("state_function.R")

# fluidPage(
#   titlePanel("State Map"), 
#   mainPanel(leafletOutput("StateMap"),
#             sliderInput("range","Year", min=1980, max=2014, value = c(1980,2014), step = 1),
#             checkboxInput("legend", "Show legend", TRUE))
#   )
