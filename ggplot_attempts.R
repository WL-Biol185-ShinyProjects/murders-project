library(ggplot2)
murders %>%
  group_by(State) %>%
  ggplot(aes(State, Incident)) + geom_bar(stat = 'identity')
