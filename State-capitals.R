Coordinates <- read.csv("us-state-capitals.csv")

#making table with coordinates for popups 

Coordinates$description <- NULL
popup_coordinates <- left_join(incident_per_state, Coordinates, c("State" = "name"))

  
