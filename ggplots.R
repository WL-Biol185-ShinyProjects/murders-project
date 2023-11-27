library(shiny)
library(leaflet)
library(geojsonio)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(lubridate)


source("state_function.R")

#Murders by month by state & year -- bar graph
#using popup_totalmurders table 

murderbargraph <- murder_table %>%
  select(1:3) %>%
  group_by(State, Year, Month) %>%
  mutate(monthly_murders = n())
  # summarise(across(c(Month, monthly_murders)))

ggplot(data = murderbargraph, aes(State, monthly_murders)) + geom_line()



  # mutate(Month = factor(Month, levels = month.name)) %>%
  # arrange(Month)





# ggplot(data = popup_totalmurders, aes(x = Month, y = total_murders)

# Line graph of incident over time

# Race Breakdown pie graph

victimrace <- murder_table %>%
  count(Victim.Race)

  ggplot(victimrace, aes(x = "", y = victimrace$n, fill = victimrace$Victim.Race)) + 
    geom_bar(stat = "identity", width =1, color = "black") +
    coord_polar("y", start = 0) + theme_void() 
              

    