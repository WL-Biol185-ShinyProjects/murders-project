library(shiny)
library(tidyverse)
library(leaflet)
library(stringr)
library(geojsonio)
library(DT)


murder_table <- readRDS("murders.RData")
##Calling initial data and filtering data
source("murder_table.R")

##Calling state_function to summarize statistics for each state into the most common aspects of crimes 
source("state_function.R")

source("ggplots.R")

navbarPage(title = "Murder Trends in the U.S. from 1980 to 2014",
           theme = shinythemes::shinytheme("sandstone"),
           header = tags$style(HTML("
                                    .leaflet-container {
                                    background: #BAECFF;
                                    outline: 0;
                                    }"
                                    )),
           tags$style(type = "text/css", ".navbar-brand {font-size: 36px;}"),
           tabPanel("Map",
                    tags$h2("What are the characteristics around murder incidences pertinent to each state across 1980 to 2014?"),
                    mainPanel(sliderInput("range","Year", min=1980, max=2014, value = 1980, step = 1),
                      fluidRow(
                        column( leafletOutput("StateMap", width = 900, height = 600), width= 9),
                        column(tags$h2("The homicide rate doubled from the early 1960s to the 1970, increasing from 4.6 per 100,000 US residents to 9.7 per 100,000. In 1980 the rate peaked and then again in 1991. Since then the homicide rate has dramatically declined until 2010.. Our website hope to visualize these trends of decline and the characteristics surrounding the perpetrators and victims."), width=3)
                      )
                    )),
           
           
           tabPanel("Murder Incidence by State and Year",
                    tags$h2("How have murder incidences per month quantitatively changed across the years?"),
                    fluidRow(
                      column(width = 2, offset = 0,
                             sliderInput("Year", "Year",  min=1980, max=2014, value = 1980, step = 1)), 
                      column(width = 2, offset = 0,
                             selectInput("State", "State", choices = unique(murderbargraph2$State)))),
                    plotOutput("barplot", width = 1200, height = 600)
                    ),
           
           
           tabPanel("Weapon Pie Graph",
                    tags$h2("What is the most common murder weapon nation-wide each year between 1980 to 2010 in comparison to the average across this entire time period?"),
                    sliderInput("Year", "Year", min = 1980, max = 2010, value = 1980, step = 1),
                    splitLayout(plotOutput("weaponpiechartinteractive", width = 600, height = 600), plotOutput("weaponpiechart", width = 600, height = 600))
                   
           ), 
           
           tabPanel("Murder Incidence Through the Years",
                    tags$h2("How has the national trend of murder rate changed from 1980 to 2010?"),
                    plotOutput("scatterplot", width = 1200, height = 600)),
           
           
           tabPanel("Race Pie Graph",
                    tags$h2("What is the race distribution of the victims and perpetrators from 1980 to 2010? "),
                    tags$h2("The visualization concerning the victim race is located on the left, and the visualization concerning the perpetrator is located on the right of the page."), 
                    splitLayout(plotOutput("racepiechart", width = 600, height = 600), plotOutput("perpracepiechart", width = 600, height = 600)),
                    ),
           
           
           tabPanel("Raw Data", DT::dataTableOutput("mytable"), downloadButton("downloadData", "Download Our Data")),
           
           
           tabPanel("About the Creators",
                    tags$h2("Meet the Creators!"),
                    tags$img(src = "creators.jpg", width = 600),
                    tags$figcaption("Lucy Worthy: Biology Major, Mason Davis: Neurosciene Major, Gretta Syrett: Biology Major, Anna Marie Harding: Neuroscience Major")
                    )
           )