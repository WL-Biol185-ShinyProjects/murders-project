##Calling initial data set
murder_table <- readRDS("murders.RData")

#Fixing spelling error in data set 
murder_table$State <- str_replace_all(murder_table$State, "Rhodes Island", "Rhode Island")

##Merging with geojson
geo <- geojson_read("states.geo.json", 
                    what = "sp")

