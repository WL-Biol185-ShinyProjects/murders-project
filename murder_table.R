##Calling initial data set
murder_table <- readRDS("murders.RData")

##Filtering data set for slider
filteredData <- reactive({
  murder_table[murder_table$Year >= input$range[1] & murder_table$Year <= input$range[2],]
})

##Merging with geojson
geo <- geojson_read("states.geo.json", 
                    what = "sp")

##Filtering data
incident_per_state <- murder_table %>%
  group_by(State) %>%
  summarise(total_murders = n()) %>%
  filter(!row_number() %in% c(52))

