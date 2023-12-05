library(shiny)
library(leaflet)
library(geojsonio)
library(tidyverse)
library(dplyr)

##proxy distinguished data
original_data <-geo@data

##Adding coordinates to data set
Coordinates <- read.csv("us-state-capitals.csv")
Coordinates$description <- NULL

#summarizing data into new column
popup_totalmurders <- murder_table %>%
  group_by(State, Year) %>%
  mutate(total_murders = n())

##finding common value
common_table_victim_race <- murder_table %>%
  group_by(Year)%>%
  count(Victim.Race)%>%
  arrange(desc(n))

common_table_victim_sex <- murder_table %>%
  group_by(Year)%>%
  count(Victim.Sex)%>%
  arrange(desc(n))

common_table_weapon <- murder_table %>%
  count(Weapon)%>%
  arrange(desc(n))

common_table_relationship <- murder_table %>%
  group_by(Year)%>%
  count(Relationship)%>%
  arrange(desc(n))

common_table_perpetrator_race <- murder_table %>%
  group_by(Year)%>%
  count(Perpetrator.Race)%>%
  arrange(desc(n))

common_table_perpetrator_sex <- murder_table %>%
  group_by(Year)%>%
  count(Perpetrator.Sex)%>%
  arrange(desc(n))

#assigning common values
Common_Victim_Race <- common_table_victim_race[1, "Victim.Race"]
Common_Victim_Sex <- common_table_victim_sex[1, "Victim.Sex"]
Common_Weapon  <- common_table_weapon[1, "Weapon"]
Common_Relationship  <- common_table_relationship[1, "Relationship"]
Common_Perpetrator_Race  <- common_table_perpetrator_race[1, "Perpetrator.Race"]
Common_Perpetrator_Sex  <- common_table_perpetrator_sex[1, "Perpetrator.Sex"]

##Making a table that consolidates most common features for each state, and rounding mean age values
popup_table <- popup_totalmurders %>%
  group_by(State, Year, total_murders) %>%
  summarise(Common_Victim_Age = round(mean(Victim.Age), 1),
    Common_Perpetrator_Age = round(mean(Perpetrator.Age),1))

##Joining coordinate and popup data
popup_data <- left_join(popup_table, Coordinates, c("State" = "name"))

#raw_data <- left_join(popup_table, common_table_perpetrator_sex, common_table_perpetrator_race, common_table_relationship, common_table_weapon, c("Year" = "Year"))



