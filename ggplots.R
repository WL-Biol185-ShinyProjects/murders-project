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

ggplot(murderbargraph2, aes(x = Month, y = monthly_murders, fill = Month)) + 
  geom_bar(stat = 'identity', alpha=0.5) + 
  ylab("Murder Incidence") +
  xlab("Month") + 
  ggtitle("Murder Incidence by State and Year")

# Line graph of incident over time

murderline <- murder_table %>%
  select(1:3) %>%
  group_by(Year) %>%
  summarize(total_murders = n())

ggplot(murderline, aes(x= Year, y = total_murders)) + 
  geom_point(shape=24, fill = "darkturquoise", color = "darkturquoise", size=3) +
  geom_smooth(method=lm, color = "red") +
  scale_x_continuous(breaks = c(1980, 1985, 1990, 1995, 2000, 2005, 2010)) +
  ylab("Murder Incidence") +
  xlab("Year") +
  ggtitle("Murder Incidence Through the Years")



# Race Breakdown pie graph

victimrace <- murder_table %>%
  count(Victim.Race)


  # ggplot(victimrace, aes(x = "", y = victimrace$n, fill = victimrace$Victim.Race)) + 
  #   geom_bar(stat = "identity", width =1, color = "black") +
  #   coord_polar("y", start = 0) + theme_void() + scale_fill_discrete(name="Victim Race")
  #             

ggplot(common_table_weapon, aes(x = "", y = common_table_weapon$n, fill = common_table_weapon$Weapon)) + 
  geom_bar(stat = "identity", width =1, color = "black", alpha=0.7) +
  coord_polar("y", start = 0) + theme_void() + 
  scale_fill_discrete(name = "Weapon Type") + 
  scale_fill_manual("legend", values = c("Blunt Object" = "red",
                                         "Drowning" = "green", 
                                         "Drugs" = "cornsilk",
                                         "Explosives" = "pink",
                                         "Fall" = "yellow", 
                                         "Fire" = "darkgreen",
                                         "Gun" = "blue", 
                                         "Handgun" = "deeppink",
                                         "Knife" = "brown",
                                         "Poison" = "coral1",
                                         "Rifle" = "darkolivegreen1",
                                         "Shotgun" = "darkmagenta",
                                         "Strangulation" = "darkgoldenrod1",
                                         "Suffocation" = "deepskyblue",
                                         "Unknown" = "darksalmon"
                                         ))
