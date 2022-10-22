
library(tidyverse)

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

library(readr)

#readr :: write_csv(clean_decathlon/"clean_data/clean_decathlon.csv")
 #"Error in FUN(left, right) : non-numeric argument to binary operator"

write_csv(clean_decathlon,"clean_data/clean_decathlon.csv")

# Call the  csv, change a new name and works with it.

clean_deca <-read_csv("clean_data/clean_decathlon.csv")

clean_deca  

library(janitor)  

clean_deca %>% 
  names()

view(clean_deca)

clean_deca %>% 
  rename("long_jump" = "Long.jump", "shot_put" = "Shot.put","high_jump" = "High.jump",
         "110m_hurdle" = "110m.hurdle","discus" = "Discus",
         "pole_vault" = "Pole.vault", "javeline" = "Javeline", 
         "rank" = "Rank", "points" = "Points", "competition" = "Competition")



 
# #Who had the longest long jump seen in the data?
# What was the average 100m time in each competition?
#   Who had the highest total points across both competitions?
#   What was the shot-put scores for the top three competitors in each competition?
#   What was the average points for competitors who ran the 400m in less than 50 seconds vs. those than ran 400m in more than 50 seconds?



















