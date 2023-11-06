##Calling initial data set
murder_table <- readRDS("murders.RData")
geo <- geojson_read("states.geo.json", 
                    what = "sp")

##Filtering data
incident_per_state <- murder_table %>%
  group_by(State) %>%
  summarise(total_murders = n()) %>%
  filter(!row_number() %in% c(52))