library(shiny)
library(leaflet)
library(geojsonio)
library(tidyverse)

##Making state tables for individual features 

Alabama <- murder_table %>%
  filter(State == "Alabama")

Alaska <- murder_table %>%
    filter(State == "Alaska")
  
Arizona <- murder_table %>%
  filter(State == "Arizona")
  
Arkansas <- murder_table %>%
  filter(State == "Arkansas")
  
California <- murder_table %>%
  filter(State == "California")

Colorado <- murder_table %>%
  filter(State == "Colorado")

  
Connecticut <- murder_table %>%
  filter(State == "Connecticut")

Delaware <- murder_table %>%
  filter(State == "Delaware")
  
  
Florida <- murder_table %>%
    filter(State == "Florida")

Georgia <- murder_table %>%
  filter(State == "Georgia")
  
  
Hawaii <- murder_table %>%
  filter(State == "Hawaii")
  

Idaho <- murder_table %>%
  filter(State == "Idaho")
  
  
Illinois <- murder_table %>%
  filter(State == "Illinois")
  

Indiana <- murder_table %>%
  filter(State == "Indiana")

  
Iowa <- murder_table %>%
  filter(State == "Iowa")
  
Kansas <- murder_table %>%
  filter(State == "Kansas")


Kentucky <- murder_table %>%
  filter(State == "Kentucky")

  
Louisiana <- murder_table %>%
    filter(State == "Louisiana")
  
  
Maine <- murder_table %>%
   filter(State == "Maine")
  

Maryland <- murder_table %>%
  filter(State == "Maryland")

  
Massachusetts <- murder_table %>%
   filter(State == "Massachusetts")

  
Michigan <- murder_table %>%
  filter(State == "Michigan")
  
  
Minnesota <- murder_table %>%
  filter(State == "Minnesota")
 

Mississippi <- murder_table %>%
  filter(State == "Minnesota")

Missouri <- murder_table %>%
  filter(State == "Missouri")

  
Montana <- murder_table %>%
   filter(State == "Montana")
  
 
Nebraska <- murder_table %>%
  filter(State == "Nebraska")

Nevada <- murder_table %>%
  filter(State == "Nevada")

New_Jersey <- murder_table %>%
  filter(State == "New Jersey")
  
New_Mexico <- murder_table %>%
  filter(State == "New Mexico ")

New_York <- murder_table %>%
  filter(State == "New York")


North_Dakota<- murder_table %>%
  filter(State == "North Dakota")


North_Carolina <- murder_table %>%
  filter(State == "North Carolina")


Ohio <- murder_table %>%
  filter(State == "Ohio")


Oregon<- murder_table %>%
  filter(State == "Oregon")


Pennsylvania <- murder_table %>%
  filter(State == "Pennsylvania")


South_Carolina <- murder_table %>%
  filter(State == "South Carolina")


South_Dakota <- murder_table %>%
  filter(State == "South Dakota")

Tennessee <- murder_table %>%
  filter(State == "Tennessee")

Texas <- murder_table %>%
  filter(State == "Texas")


Utah <- murder_table %>%
  filter(State == "Utah")

Vermont <- murder_table %>%
  filter(State == "Vermont ")

Virginia <- murder_table %>%
  filter(State == "Virginia")

Washington <- murder_table %>%
  filter(State == "Washington")

West_Virginia <- murder_table %>%
  filter(State == "West Virginia")

Wisconsin <- murder_table %>%
  filter(State == "Wisconsin")

Wyoming <- murder_table %>%
  filter(State == "Wyoming")




  
  
  
  
  
  