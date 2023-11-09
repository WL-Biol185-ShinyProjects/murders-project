##Calling initial data set
murder_table <- readRDS("murders.RData")



##Merging with geojson
geo <- geojson_read("states.geo.json", 
                    what = "sp")

##Filtering data
incident_per_state <- murder_table %>%
  group_by(State) %>%
  summarise(total_murders = n()) %>%
  filter(!row_number() %in% c(52))

