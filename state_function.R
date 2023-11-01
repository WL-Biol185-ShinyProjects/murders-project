library(shiny)
library(leaflet)
library(geojsonio)
library(tidyverse)

Alabama <- murder_table %>%
  filter(State == "Alabama")

Alabama_weapon <- Alabama[, -c(2:12)] 
names(which.max(table(Alabama_weapon$Weapon)))

Alabama_table_function <- function(Alabama, State, Victim.Race) {
  tab <- base::table(Alabama[, names(Alabama) %in% c(State, Victim.Race)])
  return(tab)
}
# 
# state_weapon_function(murder_table,"State","Weapon")
# 

  
Alabama_table_function(Alabama, "State", "Victim.Race")

