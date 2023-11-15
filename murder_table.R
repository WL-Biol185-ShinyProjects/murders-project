##Calling initial data set
murder_initial <- readRDS("murders.RData")

#Fixing spelling error in data set 
library(stringr)
murder_table$State <- str_replace_all(murder_table$State, "Rhodes Island", "Rhode Island")

##Merging with geojson
geo <- geojson_read("states.geo.json", 
                    what = "sp")

##Filtering data
# incident_per_state <- murder_table %>%
#   group_by(State) %>%
#   summarise(total_murders = n()) %>%
#   filter(!row_number() %in% c(52))

