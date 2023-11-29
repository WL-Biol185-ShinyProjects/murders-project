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

source("ggplots.R")

navbarPage(titlePanel("Murder Rates by State"),
           tabPanel("Map",
                    tags$h2("This map summarizes data of US murder rates by state across selected years from 1980 to 2010"), 
                    mainPanel(leafletOutput("StateMap"),
                              sliderInput("range","Year", min=1980, max=2014, value = 1980, step = 1),
                              checkboxInput("legend", "Show legend", TRUE))),
           tabPanel("Graphs", plotOutput("scatterplot"), 
                    selectInput("Month", "Choose a Month", choices = unique(murderbargraph$Month)), 
                    selectInput("State", "Choose a State", choices = unique(murderbargraph$State))),
           tabPanel("Race Pie Graph", plotOutput("racepiechart"))
           )