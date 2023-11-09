library(shiny)
library(leaflet)
library(geojsonio)
library(tidyverse)


##Making a table that consolidates most common features for each state, and rounding mean age values
popup_table <- murder_table %>%
  group_by(State) %>%
  summarise(Common_Victim_Age = round(mean(Victim.Age), 1),
            Common_Victim_Race = names(which.max(table(murder_table$Victim.Race))), 
            Common_Victim_Sex = names(which.max(table(murder_table$Victim.Sex))), 
            Common_Weapon = names(which.max(table(murder_table$Weapon))), 
            Common_Relationship = names(which.max(table(murder_table$Relationship))),
            Common_Perpetrator_Age = round(mean(Perpetrator.Age),1),
            Common_Perpetrator_Race = names(which.max(table(murder_table$Perpetrator.Race))),
            Common_Perpetrator_Sex = names(which.max(table(murder_table$Perpetrator.Sex))))

##Joining coordinate and popup data
Coordinates$description <- NULL
popup_data <- left_join(popup_table, popup_coordinates, c("State" = "State"))

##Filtering data set for slider
filteredData <- reactive({
  popup_data(popup_data$Year >= input$range[1] & popup_data$Year <= input$range[2],)
})
            