library(readr)
library(gganimate)
Final_Presidential_Results_2000_2016 <- read_csv("Final_Presidential_Results_2000-2016.csv")

#Animated Plot of 2000-2016 PA Presidential Election Results by County
ggplot(Final_Presidential_Results_2000_2016) +
  geom_segment( aes(x=county, xend=county, y=Dem_Percent_Vote, yend=Rep_Percent_Vote), color="grey") +
  geom_point( aes(x=county, y=round(Dem_Percent_Vote, digits = 0)), color=rgb(0,0,1,0.5), size=3 ) +
  geom_point( aes(x=county, y=round(Rep_Percent_Vote, digits = 0)), color=rgb(1,0,0,0.5), size=3 ) +
  coord_flip() +
  labs(title = 'Pennsylvania Presidential Election Results by County', 
       subtitle = 'Year: {closest_state} ',
       x = NULL, 
       y = 'Percent of Total Vote') +
  transition_states(Year, state_length = 10, wrap = FALSE)
