#Plot 2016 General Election Results by County
ggplot(Final_Presidential_Results_2016_General) +
  geom_segment( aes(x=county, xend=county, y=Dem_Percent_Vote, yend=Rep_Percent_Vote), color="grey") +
  geom_point( aes(x=county, y=round(Dem_Percent_Vote, digits = 0)), color=rgb(0,0,1,0.5), size=3 ) +
  geom_point( aes(x=county, y=round(Rep_Percent_Vote, digits = 0)), color=rgb(1,0,0,0.5), size=3 ) +
  coord_flip() +
  labs(title = 'Pennsylvania Presidential Election Results',
       subtitle = "Year: 2016 General",
                     x = NULL, 
                     y = 'Percent of Total Vote')
