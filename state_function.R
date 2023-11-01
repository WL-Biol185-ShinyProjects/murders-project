library(shiny)
library(leaflet)
library(geojsonio)
library(tidyverse)

Alabama <- murder_table %>%
  filter(State == "Alabama")

Alabama_weapon <- Alabama[, -c(2:12)] 
names(which.max(table(Alabama_weapon$Weapon)))

popup_table <- murder_table %>%
  group_by(State) %>%
  summarise(Common_Victim_Age = mean(Victim.Age), 
            Common_Victim_Race = names(which.max(table(murder_table$Victim.Race))), 
            Common_Victim_Sex = names(which.max(table(murder_table$Victim.Age))), 
            Common_Weapon = names(which.max(table(murder_table$Weapon))), 
            Common_Relationship = names(which.max(table(murder_table$Relationship))))

            
