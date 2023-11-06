library(shiny)
library(leaflet)
library(geojsonio)
library(tidyverse)

##Making state tables for individual features 

Alabama <- murder_table %>%
  filter(State == "Alabama")
 
Alabama$age_average <-(which.max(Alabama$Victim.Age))

Alaska <- murder_table %>%
    filter(State == "Alaska")
  
Alaska_weapon <- Alaska[, -c(2:12)] 
wepon_alaska <- names(which.max(table(Alaska_weapon$Weapon)))

Arizona <- murder_table %>%
  filter(State == "Arizona")
  
Arizona_weapon <- Arizona[, -c(2:12)] 
  names(which.max(table(Arizona_weapon$Weapon)))
  
  
Arkansas <- murder_table %>%
  filter(State == "Arkansas")
  
Arkansas_weapon <- Arkansas[, -c(2:12)] 
  names(which.max(table(Arkansas_weapon$Weapon)))

California <- murder_table %>%
  filter(State == "California")
  
California_weapon <- California[, -c(2:12)] 
  names(which.max(table(California_weapon$Weapon)))

Colorado <- murder_table %>%
  filter(State == "Colorado")
  
Colorado_weapon <- Colorado[, -c(2:12)] 
  names(which.max(table(Colorado_weapon$Weapon)))

  
Connecticut <- murder_table %>%
  filter(State == "Connecticut")
  
Connecticut_weapon <- Connecticut[, -c(2:12)] 
  names(which.max(table(Connecticut_weapon$Weapon))) 
 
Delaware <- murder_table %>%
  filter(State == "Delaware")
  
Delaware_weapon <- Delaware[, -c(2:12)] 
  names(which.max(table(Delaware_weapon$Weapon)))
  
Florida <- murder_table %>%
    filter(State == "Florida")
  
Florida_weapon <- Florida[, -c(2:12)] 
  names(which.max(table(Florida_weapon$Weapon)))
  
Georgia <- murder_table %>%
  filter(State == "Georgia")
  
Georgia_weapon <- Georgia[, -c(2:12)] 
  names(which.max(table(Georgia_weapon$Weapon)))
  
Hawaii <- murder_table %>%
  filter(State == "Hawaii")
  
Hawaii_weapon <- Hawaii[, -c(2:12)] 
  names(which.max(table(Hawaii_weapon$Weapon)))
  
Idaho <- murder_table %>%
  filter(State == "Idaho")
  
Idaho_weapon <- Idaho[, -c(2:12)] 
  names(which.max(table(Idaho_weapon$Weapon)))
  
Illinois <- murder_table %>%
  filter(State == "Illinois")
  
Illinois_weapon <- Illinois[, -c(2:12)] 
  names(which.max(table(Illinois_weapon$Weapon)))
  
Indiana <- murder_table %>%
  filter(State == "Indiana")

Indiana_weapon <- Indiana[, -c(2:12)] 
  names(which.max(table(Indiana_weapon$Weapon)))
  
Iowa <- murder_table %>%
  filter(State == "Iowa")
  
Iowa_weapon <- Iowa[, -c(2:12)] 
  names(which.max(table(Iowa_weapon$Weapon)))
  
Kansas <- murder_table %>%
  filter(State == "Kansas")
  
Kansas_weapon <- Kansas[, -c(2:12)] 
  names(which.max(table(Kansas_weapon$Weapon)))
  

Kentucky <- murder_table %>%
  filter(State == "Kentucky")
  
Kentucky_weapon <- Kentucky[, -c(2:12)] 
  names(which.max(table(Kentucky_weapon$Weapon)))
  
Louisiana <- murder_table %>%
    filter(State == "Louisiana")
  
Louisiana_weapon <- Louisiana[, -c(2:12)] 
  names(which.max(table(Louisiana_weapon$Weapon)))
  
Maine <- murder_table %>%
   filter(State == "Maine")
  
Maine_weapon <- Maine[, -c(2:12)] 
  names(which.max(table(Maine_weapon$Weapon)))

Maryland <- murder_table %>%
  filter(State == "Maryland")
  
Maryland_weapon <- Maryland[, -c(2:12)] 
  names(which.max(table(Maryland_weapon$Weapon)))
  
  
Massachusetts <- murder_table %>%
   filter(State == "Massachusetts")
  
Massachusetts_weapon <- Massachusetts[, -c(2:12)] 
  names(which.max(table(Massachusetts_weapon$Weapon)))
  
  
Michigan <- murder_table %>%
  filter(State == "Michigan")
  
Michigan_weapon <- Michigan[, -c(2:12)] 
  names(which.max(table(Michigan_weapon$Weapon)))
  
  
Minnesota <- murder_table %>%
  filter(State == "Minnesota")
  
Minnesota_weapon <- Minesota[, -c(2:12)] 
  names(which.max(table(Minnesota_weapon$Weapon)))
 

Mississippi <- murder_table %>%
  filter(State == "Minnesota")

Mississippi_weapon <- Mississippi[, -c(2:12)] 
names(which.max(table(Mississippi_weapon$Weapon)))

Missouri <- murder_table %>%
  filter(State == "Missouri")

Missouri_weapon <- Missouri[, -c(2:12)] 
names(which.max(table(Missouri_weapon$Weapon)))

  
Montana <- murder_table %>%
   filter(State == "Montana")
  
Montana_weapon <- Montana[, -c(2:12)] 
  names(which.max(table(Montana_weapon$Weapon)))
  
 
Nebraska <- murder_table %>%
  filter(State == "Nebraska")

Nebraska_weapon <- Nebraska[, -c(2:12)] 
  names(which.max(table(Nebraska_weapon$Weapon)))

Nevada <- murder_table %>%
  filter(State == "Nevada")

Nevada_weapon <- Nevada[, -c(2:12)] 
  names(which.max(table(Nevada_weapon$Weapon)))

New_Jersey <- murder_table %>%
  filter(State == "New Jersey")

New_Jersey_weapon <- New_Jersey[, -c(2:12)] 
  names(which.max(table(New_Jersey_weapon$Weapon)))
  
New_Mexico <- murder_table %>%
  filter(State == "New Mexico ")

New_Mexico_weapon <- New_Mexico [, -c(2:12)] 
names(which.max(table(New_Mexico_weapon$Weapon)))


New_York <- murder_table %>%
  filter(State == "New York")

New_York_weapon <- New_York[, -c(2:12)] 
  names(which.max(table(New_York_weapon$Weapon)))


North_Dakota<- murder_table %>%
  filter(State == "North Dakota")

North_Dakota_weapon <- North_Dakota[, -c(2:12)] 
  names(which.max(table(North_Dakota_weapon$Weapon)))


North_Carolina <- murder_table %>%
  filter(State == "North Carolina")

North_Carolina_weapon <- North_Carolina[, -c(2:12)] 
  names(which.max(table(North_Carolina_weapon$Weapon)))


Ohio <- murder_table %>%
  filter(State == "Ohio")

Ohio_weapon <- Ohio[, -c(2:12)] 
  names(which.max(table(Ohio_weapon$Weapon)))


Oregon<- murder_table %>%
  filter(State == "Oregon")

Oregon_weapon <- Oregon[, -c(2:12)] 
  names(which.max(table(Oregon_weapon$Weapon)))


Pennsylvania <- murder_table %>%
  filter(State == "Pennsylvania")

Pennsylvania_weapon <- Pennsylvania[, -c(2:12)] 
  names(which.max(table(Pennsylvania_weapon$Weapon)))


South_Carolina <- murder_table %>%
  filter(State == "South Carolina")

South_Carolina_weapon <- South_Carolina[, -c(2:12)] 
  names(which.max(table(South_Carolina_weapon$Weapon)))

South_Dakota <- murder_table %>%
  filter(State == "South Dakota")

South_Dakota_weapon <- South_Dakota[, -c(2:12)] 
names(which.max(table(South_Dakota_weapon$Weapon)))

Tennessee <- murder_table %>%
  filter(State == "Tennessee")

Tennessee_weapon <- Tennessee[, -c(2:12)] 
names(which.max(table(Tennessee_weapon$Weapon)))

Texas <- murder_table %>%
  filter(State == "Texas")

Texas_weapon <-Texas[, -c(2:12)] 
  names(which.max(table(Texas_weapon$Weapon))) 

Utah <- murder_table %>%
  filter(State == "Utah")

Utah_weapon <- Utah[, -c(2:12)] 
names(which.max(table(Utah_weapon$Weapon)))

Vermont <- murder_table %>%
  filter(State == "Vermont ")

Vermont_weapon <- Vermont[, -c(2:12)] 
names(which.max(table(Vermont_weapon$Weapon)))

Virginia <- murder_table %>%
  filter(State == "Virginia")

Virginia_weapon <- Virginia[, -c(2:12)] 
names(which.max(table(Virginia_weapon$Weapon)))

Washington <- murder_table %>%
  filter(State == "Washington")

Washington_weapon <- Washington[, -c(2:12)] 
names(which.max(table(Washington_weapon$Weapon)))

West_Virginia <- murder_table %>%
  filter(State == "West Virginia")

West_Virginia_weapon <- West_Virginia[, -c(2:12)] 
names(which.max(table(West_Virginia_weapon$Weapon)))

Wisconsin <- murder_table %>%
  filter(State == "Wisconsin")

Wisconsin_weapon <- Wisconsin[, -c(2:12)] 
names(which.max(table(Wisconsin_weapon$Weapon)))

Wyoming <- murder_table %>%
  filter(State == "Wyoming")

Wyoming_weapon <- Wyoming[, -c(2:12)] 
names(which.max(table(Wyoming_weapon$Weapon)))




  
  
  
  
  
  