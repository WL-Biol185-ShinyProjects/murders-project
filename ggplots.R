library(shiny)
library(leaflet)
library(geojsonio)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(scales)


source("state_function.R")

#Murders by month by state & year -- bar graph
#using popup_totalmurders table 

murderbargraph <- murder_table %>%
  select(1:3) %>%
  group_by(State, Year, Month) %>%
  mutate(monthly_murders = n())

murderbargraph2 <- distinct(murderbargraph) %>%
  mutate(Month = factor(Month, levels = month.name)) %>%
  arrange(Month)

#year table for weapon pie chart 
year_table <- murder_table %>%
  select(Year, "Victim.Race", "Perpetrator.Race", Weapon) %>%
  group_by(Year)
  

# Line graph of incident over time

murderline <- murder_table %>%
  select(1:3) %>%
  group_by(Year) %>%
  summarize(total_murders = n())




# Race Breakdown pie graph

victimrace <- murder_table %>%
  count(Victim.Race)

perprace <- murder_table %>%
  count(Perpetrator.Race)

  # ggplot(victimrace, aes(x = "", y = victimrace$n, fill = victimrace$Victim.Race)) + 
  #   geom_bar(stat = "identity", width =1, color = "black") +
  #   coord_polar("y", start = 0) + theme_void() + scale_fill_discrete(name="Victim Race")
  #             

