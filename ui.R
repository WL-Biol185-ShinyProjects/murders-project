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

navbarPage(title = "Murder Trends in the U.S. from 1980 to 2010",
           theme = shinythemes::shinytheme("sandstone"),
           tags$style(type = "text/css", ".navbar-brand {font-size: 36px;}"),
           tabPanel("Map",
                    mainPanel(leafletOutput("StateMap", width = 900, height = 600),
                              sliderInput("range","Year", min=1980, max=2014, value = 1980, step = 1),
                              tags$h2("This map summarizes data of US murder rates by state across selected years from 1980 to 2010")
                    )),
           tabPanel("Murder Incidence by State and Year", 
                    plotOutput("barplot", width = 1200, height = 600), 
                    selectInput("Year", "Year", choices = unique(murderbargraph2$Year)), 
                    selectInput("State", "State", choices = unique(murderbargraph2$State)),
                    tags$h2("This graph allows you to visualize which months had the highest murder incidence rates per state, per year.")),
           tabPanel("Weapon Pie Graph",
                    plotOutput("weaponpiechart", width = 600, height = 600),
                    tags$h2("This graph allows you to visulize the most common murder weapon nation-wide from 1980 to 2010.")),
           tabPanel("Murder Incidence Through the Years", 
                    plotOutput("scatterplot", width = 1200, height = 600),
                    tags$h2("This graph allows you to visualize the national trend of murder incidences from 1980 to 2010.")),
           tabPanel("Race Pie Graph",
                    splitLayout(plotOutput("racepiechart", width = 600, height = 600), plotOutput("perpracepiechart", width = 600, height = 600)),
                    tags$h2("These graphs allow you to visualize the race distribution of victims and perpetrators from 1980 to 2010. The visualization concerning the victim race is located on the left, and the visualization concerning the perpetrator is located on the right of the page.")),
           tabPanel("About the Creators",
                    tags$h2("Meet the Creators!"),
                    tags$img(src = "creators.jpg", width = 600),
                    tags$figcaption("Lucy Worthy, Mason Davis, Gretta Syrett, Anna Marie Harding")
                    )
           )