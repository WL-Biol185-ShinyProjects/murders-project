##Adding coordinates to data set
Coordinates <- read.csv("us-state-capitals.csv")
Coordinates$description <- NULL
popup_coordinates <- left_join(incident_per_state, 
                               Coordinates, c("State" = "name"))