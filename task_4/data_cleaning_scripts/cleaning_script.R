# Import raw data
library(readxl)
library(tidyverse)



candy_2015 <- read_excel("raw_data/boing-boing-candy-2015.xlsx")
candy_2016 <- read_excel("raw_data/boing-boing-candy-2016.xlsx")
candy_2017 <- read_excel("raw_data/boing-boing-candy-2017.xlsx")




library(readxl)
library(tidyverse)
library(here)
library(dplyr)
library(janitor)


candy_2015 <- read_excel(here("raw_data/boing-boing-candy-2015.xlsx"))
candy_2016 <- read_excel(here("raw_data/boing-boing-candy-2016.xlsx"))
candy_2017 <- read_excel(here("raw_data/boing-boing-candy-2017.xlsx"))

#Final candy_master.csv 
here:here()

master_candy <- read_csv(here("clean-data/candy_master.csv"))


names(candy_2015)

# try to remove columns by starts with
clean_candy_2015 <- candy_2015 %>% select(-starts_with('P'))



# Remove columns by range. More than remove , I keep the columns I am interested

clean_candy_2015 <- candy_2015 %>% select(c(1:96))




#Janitor, clean names, renames
janitor_clean_candy_2015 <- clean_candy_2015 %>% 
  clean_names()



rename_janitor_clean_candy_2015 <- janitor_clean_candy_2015 %>% 
  rename("age" ="how_old_are_you", "year"= "timestamp","trick_or_treat" = "are_you_going_actually_going_trick_or_treating_yourself")




#remove more colums

remove_col_rename_janitor_clean_candy_2015 <- rename_janitor_clean_candy_2015 %>% 
  select(c(1:5,8:11,13:15,19:22,24:25,27:30,32,35:37,39:84,86:92,96))






#Change year

year_remove_col_rename_janitor_clean_candy_2015 <-  remove_col_rename_janitor_clean_candy_2015 %>% 
  mutate(year = coalesce("2015"))





#Change age

age_year_remove_col_rename_janitor_clean_candy_2015 <- year_remove_col_rename_janitor_clean_candy_2015 %>% 
  mutate(age = str_replace(age,"\\..*", "")) %>% 
  mutate(age = as.numeric(age))




#Start cleaning candy_2016

names(candy_2016)

#remove columns by range
clean_candy_2016 <- candy_2016 %>% select(-c(104:123))





# Remove by column by index

clean_candy_2016 <- clean_candy_2016 %>% 
  select(-c(79,102))


clean_candy_2016 <- clean_candy_2016 %>% 
  select(-c(6))





#janitor, clean names

janitor_clean_candy_2016 <- clean_candy_2016 %>% 
  clean_names()

#view(janitor_clean_candy_2016)



rename_janitor_clean_candy_2016 <-janitor_clean_candy_2016 %>% 
  rename("gender" = "your_gender","age" = "how_old_are_you")






#more cleaning, not properly done

rename_janitor_clean_candy_2016 <- rename_janitor_clean_candy_2016 %>% 
  select(-c(6,8,12,19,22,23,26,27,31,38,43,93,100))


rename_janitor_clean_candy_2016 <- rename_janitor_clean_candy_2016 %>% 
  rename("toblerone_something_or_other" = "tolberone_something_or_other")


rename2_janitor_clean_candy_2016 <- rename_janitor_clean_candy_2016 %>% 
  rename("country" = "which_country_do_you_live_in", "year"= "timestamp", "trick_or_treat"= "are_you_going_actually_going_trick_or_treating_yourself")




remove_col_rename_janitor_clean_candy_2016 <- rename2_janitor_clean_candy_2016 %>% 
  select(-c(6,9,15,16,17,18,19,22,25,28,32,57,76,81,87))




#change timeslap 2016


year_remove_col_rename_janitor_clean_candy_2016 <-  remove_col_rename_janitor_clean_candy_2016 %>% 
  mutate(year = coalesce("2016"))




#round age in 2016

age_year_remove_col_rename_janitor_clean_candy_2016 <- year_remove_col_rename_janitor_clean_candy_2016 %>% 
  mutate(age = as.numeric(age)) %>% 
  mutate(age = round(age,digit = 0))



#more cleaning

#country 2016 remove_col_rename_janitor_clean_candy_2016

country_year_remove_col_rename_janitor_clean_candy_2016 <- age_year_remove_col_rename_janitor_clean_candy_2016 %>%
  mutate(country = recode(country,"us"= "USA", "england"= "UK","england" = "UK", "Unite states of America" = "USA", "England" = "UK", "uSA" = "USA", "france"=  "France", "croatia" = "Croatia", "USSA"= "USA","USA (I think but it's an election year so who can really tell)" = "USA" , "United States" = "USA","usa"= "USA","uk"= "UK","USA!" = "USA","U.S.A." = "USA","51.0" ="NA","canada"= "Canada","America"= "USA","USA! USA! USA!"= "USA","US"= "USA","United States of America" = "USA","united states"= "USA","Usa" ="USA","U.S."= "USA","Us" ="USA","US" = "USA","Units States" ="USA","belgium" = "Belgium","united states"= "USA","USA USA USA" ="USA", "the best one-usa" = "USA","españa"= "España","u.s."= "USA","United Kingdom"= "UK","hungary"= "Hungary", "united states of america" ="USA","United states" = "USA", "USA! USA!" = "USA"))




#Start cleaning data 2017.



clean_candy_2017 <-candy_2017 %>% 
  select(-c(6,12,19,21,22,23,25,26,27,31,35,38,43,69,70,75,81,96,104,105,107,108,110:120))


#janitor

janitor_clean_candy_2017 <- clean_candy_2017 %>% 
  clean_names()



#Manually, rename columns, I was not able to create a loop for remove "q1:9_"

rename_janitor_clean_candy_2017 <- janitor_clean_candy_2017 %>% 
  rename("gender" =  "q2_gender","age" = "q3_age", "country" = "q4_country","100_grand_bar" ="q6_100_grand_bar", "those_odd_marshmallow_circus_peanut_things" =  "q6_those_odd_marshmallow_circus_peanut_things","three_musketeers"="q6_three_musketeers","toblerone_something_or_other" = "q6_tolberone_something_or_other", "trail_mix"="q6_trail_mix" ,"twix" ="q6_twix","whatchamacallit_bars"= "q6_whatchamacallit_bars","york_peppermint_patties"="q6_york_peppermint_patties","anonymous_brown_globs_that_come_in_black_and_orange_wrappers_a_k_a_mary_janes"= "q6_anonymous_brown_globs_that_come_in_black_and_orange_wrappers_a_k_a_mary_janes",  "black_jacks" ="q6_black_jacks",
         "bonkers_the_candy" = "q6_bonkers_the_candy","bottle_caps"= "q6_bottle_caps","boxo_raisins" = "q6_boxo_raisins", "butterfinger" ="q6_butterfinger" ,    "cadbury_creme_eggs" = "q6_cadbury_creme_eggs", "candy_corn" = "q6_candy_corn", "caramellos"  = "q6_caramellos",  "chiclets"  ="q6_chiclets","dots" = "q6_dots","dove_bars" = "q6_dove_bars", "fuzzy_peaches" ="q6_fuzzy_peaches", "goo_goo_clusters" = "q6_goo_goo_clusters", "good_n_plenty" ="q6_good_n_plenty",  "gummy_bears_straight_up" = "q6_gummy_bears_straight_up" ,"hard_candy" ="q6_hard_candy","heath_bar" ="q6_heath_bar",  " hersheys_dark_chocolate"  = "q6_hersheys_dark_chocolate" ,"hershey_s_milk_chocolate"  ="q6_hershey_s_milk_chocolate" , "hersheys_kisses"  ="q6_hersheys_kisses",  "jolly_rancher_bad_flavor" = "q6_jolly_rancher_bad_flavor","jolly_ranchers_good_flavor" = "q6_jolly_ranchers_good_flavor" , "joy_joy_mit_iodine" ="q6_joy_joy_mit_iodine","junior_mints"="q6_junior_mints","senior_mints"="q6_senior_mints","kale_smoothie" ="q6_kale_smoothie", "kinder_happy_hippo" =  "q6_kinder_happy_hippo","kit_kat" ="q6_kit_kat" , "laffy_taffy" = "q6_laffy_taffy", "q6_lemon_heads"="q6_lemon_heads","licorice_not_black" = "q6_licorice_not_black",             "licorice_yes_black"="q6_licorice_yes_black" ,"lindt_truffle" = "q6_lindt_truffle", "lollipops" = "q6_lollipops" ,  "mars"= "q6_mars",  
         "maynards" = "q6_maynards", "mike_and_ike"  ="q6_mike_and_ike" ,"milk_duds" ="q6_milk_duds","milky_way" ="q6_milky_way" ,"regular_m_ms" ="q6_regular_m_ms",   "peanut_m_m_s"="q6_peanut_m_m_s", "blue_m_ms"  ="q6_blue_m_ms", "red_m_ms" ="q6_red_m_ms","green_party_m_ms"= "q6_green_party_m_ms",    "independent_m_ms"="q6_independent_m_ms","mint_kisses" ="q6_mint_kisses" , "mint_juleps" ="q6_mint_juleps" , "mr_goodbar"= "q6_mr_goodbar" , "necco_wafers"= "q6_necco_wafers","nestle_crunch"  ="q6_nestle_crunch" ,"nown_laters" ="q6_nown_laters", "peeps"  = "q6_peeps",  "pencils"  ="q6_pencils" ,"pixy_stix" = "q6_pixy_stix", "reese_s_peanut_butter_cups" ="q6_reese_s_peanut_butter_cups", "reeses_pieces"  = "q6_reeses_pieces" ,"reggie_jackson_bar" = "q6_reggie_jackson_bar", "rolos"  = "q6_rolos" ,           "sandwich_sized_bags_filled_with_boo_berry_crunch" =  "q6_sandwich_sized_bags_filled_with_boo_berry_crunch" , "skittles" = "q6_skittles" ,                   "smarties_american"  ="q6_smarties_american" , "smarties_commonwealth" = "q6_smarties_commonwealth" ,"snickers" =  "q6_snickers" ,                
         "sourpatch_kids_i_e_abominations_of_nature" = "q6_sourpatch_kids_i_e_abominations_of_nature","spotted_dick" = "q6_spotted_dick", "starburst"  ="q6_starburst","sweet_tarts" = "q6_sweet_tarts" ,  "swedish_fish" = "q6_swedish_fish",  "tic_tac" = "q6_tic_tacs", "lemon_heads" ="q6_lemon_heads" )




rename_janitor_clean_candy_2017 <- rename_janitor_clean_candy_2017 %>% 
  rename("year" = "internal_id","trick_or_treat" = "q1_going_out","mary_janes" = "anonymous_brown_globs_that_come_in_black_and_orange_wrappers_a_k_a_mary_janes","any_full_sized_candy_bar" = "q6_any_full_sized_candy_bar" )



#Changeinternal_id for year 2017


year_rename_janitor_clean_candy_2017 <- rename_janitor_clean_candy_2017 %>% 
  mutate(year = coalesce("2017"))



#country2017

country_rename_janitor_clean_candy_2017 <- year_rename_janitor_clean_candy_2017 %>%
  mutate(country = recode(country,"us"= "USA", "england"= "UK","england" = "UK", "Unite states of America" = "USA", "England" = "UK", "uSA" = "USA", "france"=  "France", "croatia" = "Croatia", "USSA"= "USA","USA (I think but it's an election year so who can really tell)" = "USA" , "United States" = "USA","usa"= "USA","uk"= "UK","USA!" = "USA","U.S.A." = "USA","51.0" ="NA","canada"= "Canada","America"= "USA","USA! USA! USA!"= "USA","US"= "USA","United States of America" = "USA","united states"= "USA","Usa" ="USA","U.S."= "USA","Us" ="USA","US" = "USA","Units States" ="USA","belgium" = "Belgium","united states"= "USA","USA USA USA" ="USA", "the best one-usa" = "USA","españa"= "España","u.s."= "USA","United Kingdom"= "UK","hungary"= "Hungary", "united states of america" ="USA","United states" = "USA", "USA! USA!" = "USA","United staes" = "USA","u.s.a." ="USA","USAUSAUSA"= "USA","america"= "America","finland"="Findland","unhinged states"= "Unhinged states", "US of A"= "USA","Unites States" = "USA","The United States of America"= "USA", "The United States" = "USA", "Unied States" = "USA","germany" ="Germany","U S" = "USA","U.K." ="UK","unite satates" = "USA", "cascadaia"= "Cascadia","North Carolina" ="USA","Unhinged states" = "USA","cascadia" ="Cascadia", "canada"= "Canada","USA? Hard to tell anymore.." ="USA","'merica" = "America","Pittsburgh" ="USA","United State" = "USA","United Sates"= "USA","I pretend to be from Canada, but I am really from the United States" = "USA","United Stated" ="USA","Scotland"= "UK","New Jersey" = "USA","CANADA"="Canada","United ststes" = "USA","United Statss" = "USA","enland" = "UK","united States" = "UK","United Statea" = "USA","united ststes" = "USA","	
USA USA USA!!!!"  = "USA"))

view(country_rename_janitor_clean_candy_2017)

#Problems columns numeric. Change 2017 age to numeric

age_country_rename_janitor_clean_candy_2017 <- country_rename_janitor_clean_candy_2017 %>% 
  mutate(age = as.numeric(age))



#joins the tables the master tables and save as csv




candy_master <- bind_rows(age_year_remove_col_rename_janitor_clean_candy_2015,
                          country_year_remove_col_rename_janitor_clean_candy_2016,age_country_rename_janitor_clean_candy_2017)




## Problems with the data contained in variable "age". How I tried to resolve

candy_master %>% 
  mutate(age = str_replace(age,"\\..*", "")) %>% 
  mutate(age = as.numeric(age))

candy_master$age[candy_master$age > 120] <- 0

write_csv(candy_master,"../clean_data/candy_master.csv")






























