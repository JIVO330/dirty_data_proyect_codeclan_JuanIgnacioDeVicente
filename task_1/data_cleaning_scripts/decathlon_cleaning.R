
library(tidyverse)
library(readr)
library(janitor)  




dirty_decathlon <- read_rds("raw_data/decathlon.rds")
dirty_decathlon
view(dirty_decathlon)

## The row names are the names of the athletes from the competition, not delete!. 


clean_decathlon <- dirty_decathlon

#clean_decathlon <- tibble :: rownames_to_column(clean_decathlon,"VALUE") . One option

clean_decathlon<- clean_decathlon %>% 
    rownames_to_column(var= "name")


view(clean_decathlon)

# Looks like there is still row names, numbers to remove.


row.names(clean_decathlon) <- NULL

view(clean_decathlon)

# Save in a new folder.




write_csv(clean_decathlon,"clean_data/clean_decathlon.csv") # HAVE TO BE THE LAST THING TO DO

# Call the  csv, change a new name and works with it.

clean_deca <-read_csv("clean_data/clean_decathlon.csv") # It have to do it on Notebook

clean_deca  

#Cleaning

clean_deca %>% 
  names()

view(clean_deca)

rename_clean_deca <- clean_deca %>% 
  rename("run_100m" = "100m","long_jump" = "Long.jump", "shot_put" = "Shot.put","high_jump" = "High.jump",
         "run_110m_hurdle" = "110m.hurdle","discus" = "Discus",
         "pole_vault" = "Pole.vault", "javeline" = "Javeline", 
         "rank" = "Rank", "points" = "Points", "competition" = "Competition",
         "run_400m" = "400m","run_1500m" = "1500m" )



rename_clean_deca

# No visible missing values but it will be remove all of them just in case.

rename_clean_deca %>% 
  drop_na()



# Re-write the  .csv



write_csv(rename_clean_deca,"clean_data/clean_decathlon.csv")





