library(tidyverse)
library(readxl)

#Import 2000 Results
Presidential_Results_2000_General <- read_excel("~/Downloads/Presidential Results 2016 Election - 2000 Primary.xlsx", 
                                                sheet = "2000 General")
#2000 Remove Sub-Header and Total
Presidential_Results_2000_General <- Presidential_Results_2000_General[-c(1,69),]

#Prepare final 2000 Results; Rename columns and add Percentage Columns
Final_Presidential_Results_2000_General <- Presidential_Results_2000_General %>%
  rename(county = ...1, Total_Votes = ...9) %>%
  mutate(Year = 2000,
         Dem_Percent_Vote = ((as.numeric(Dem) / as.numeric(Total_Votes)) * 100),
         Rep_Percent_Vote = ((as.numeric(Rep) / as.numeric(Total_Votes)) * 100)) %>%
  select(Year, county, Dem, Rep, Total_Votes, Dem_Percent_Vote, Rep_Percent_Vote)

view(Final_Presidential_Results_2000_General)

#Import 2004 Results
Presidential_Results_2004_General <- read_excel("~/Downloads/Presidential Results 2016 Election - 2000 Primary.xlsx", 
                                                sheet = "2004 General")
#2004 Remove Sub-Header and Total
Presidential_Results_2004_General <- Presidential_Results_2004_General[-c(1,69),]

#Prepare final 2004 Results; Rename columns and add Percentage Columns
Final_Presidential_Results_2004_General <- Presidential_Results_2004_General %>%
  rename(county = ...1, Total_Votes = ...7) %>%
  mutate(Year = 2004,
         Dem_Percent_Vote = ((as.numeric(Dem) / as.numeric(Total_Votes)) * 100),
         Rep_Percent_Vote = ((as.numeric(Rep) / as.numeric(Total_Votes)) * 100)) %>%
  select(Year, county, Dem, Rep, Total_Votes, Dem_Percent_Vote, Rep_Percent_Vote)

#Import 2008 Results
Presidential_Results_2008_General <- read_excel("~/Downloads/Presidential Results 2016 Election - 2000 Primary.xlsx", 
                                                sheet = "2008 General")

#2008 Remove Sub-Header and Total
Presidential_Results_2008_General <- Presidential_Results_2008_General[-c(1,69),]

#Prepare final 2008 Results; Rename columns and add Percentage Columns
Final_Presidential_Results_2008_General <- Presidential_Results_2008_General %>%
  rename(county = ...1, Total_Votes = ...6) %>%
  mutate(Year = 2008,
         Dem_Percent_Vote = ((as.numeric(Dem) / as.numeric(Total_Votes)) * 100),
         Rep_Percent_Vote = ((as.numeric(Rep) / as.numeric(Total_Votes)) * 100)) %>%
  select(Year, county, Dem, Rep, Total_Votes, Dem_Percent_Vote, Rep_Percent_Vote)

#Import 2012 Results
Presidential_Results_2012_General <- read_excel("~/Downloads/Presidential Results 2016 Election - 2000 Primary.xlsx", 
                                                sheet = "2012 General")
#2012 Remove Sub-Header and Total
Presidential_Results_2012_General <- Presidential_Results_2012_General[-c(1,69),]

#Prepare final 2012 Results; Rename columns and add Percentage Columns
Final_Presidential_Results_2012_General <- Presidential_Results_2012_General %>%
  rename(county = ...1, Total_Votes = ...7) %>%
  mutate(Year = 2012,
         Dem_Percent_Vote = ((as.numeric(Dem) / as.numeric(Total_Votes)) * 100),
         Rep_Percent_Vote = ((as.numeric(Rep) / as.numeric(Total_Votes)) * 100)) %>%
  select(Year, county, Dem, Rep, Total_Votes, Dem_Percent_Vote, Rep_Percent_Vote)

#Import 2016 Resultss
Presidential_Results_2016_General <- read_excel("~/Downloads/Presidential Results 2016 Election - 2000 Primary.xlsx", 
                                                sheet = "2016 General")
#2016 Remove Sub-Header and Total
Presidential_Results_2016_General <- Presidential_Results_2016_General[-c(1,69),]

#Prepare final 2016 Results; Rename columns and add Percentage Columns
Final_Presidential_Results_2016_General <- Presidential_Results_2016_General %>%
  rename(county = ...1) %>%
  mutate(Year = 2016,
         Total_Votes = as.numeric(Dem) + as.numeric(Rep) + as.numeric(Constitution) + as.numeric(Green) + as.numeric(Libertarian),
         Dem_Percent_Vote = ((as.numeric(Dem) / as.numeric(Total_Votes)) * 100),
         Rep_Percent_Vote = ((as.numeric(Rep) / as.numeric(Total_Votes)) * 100)) %>%
  select(Year, county, Dem, Rep, Total_Votes, Dem_Percent_Vote, Rep_Percent_Vote)

Final_Presidential_Results_2016_General$Total_Votes <- as.character(Final_Presidential_Results_2016_General$Total_Votes)

Final_Presidential_Results <- rbind(Final_Presidential_Results_2000_General,
                                    Final_Presidential_Results_2004_General,
                                    Final_Presidential_Results_2008_General,
                                    Final_Presidential_Results_2012_General,
                                    Final_Presidential_Results_2016_General)

write.csv(Final_Presidential_Results, "/Users/ceciliaknaub/PA-Election-Results/Final_Presidential_Results_2000-2016.csv")
