#### Preamble ####
# Purpose: Clean the survey data downloaded from [...UPDATE ME!!!!!]
# Author: Rohan Alexander [CHANGE THIS TO YOUR NAME!!!!]
# Data: 3 January 2021
# Contact: rohan.alexander@utoronto.ca [PROBABLY CHANGE THIS ALSO!!!!]
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the ACS data and saved it to inputs/data
# - Don't forget to gitignore it!
# - Change these to yours
# Any other information needed?


#### Workspace setup ####
# Use R Projects, not setwd().
library(haven)
library(tidyverse)
# Read in the raw data. 
raw_data <- readr::read_csv("inputs/data/raw_data.csv"
                     )
# Just keep some variables that may be of interest (change 
# this depending on your interests)

data2 <- data1 %>% select("Age Group", "Client Gender", "FSA", "Source of Infection") 
head(data2)

data5 <- data3 %>% filter(`Source of Infection` == "Household Contact"|
                            `Source of Infection` == "Travel"|
                            `Source of Infection` == "Community"|
                            `Source of Infection` == "Close Contact"|
                            `Source of Infection` == "Outbreaks, Other Settings"
                          
) 

data3 <- data2 %>% mutate(new_age = 
                            case_when(
                              `Age Group` == "19 and younger" ~ 15,
                              `Age Group` == "20 to 29 Years" ~ 25,
                              `Age Group` == "30 to 39 Years" ~ 35,
                              `Age Group` == "40 to 49 Years" ~ 45,
                              `Age Group` == "50 to 59 Years" ~ 55,
                              `Age Group` == "60 to 69 Years" ~ 65,
                              `Age Group` == "70 to 79 Years" ~ 75,
                              `Age Group` == "80 to 89 Years" ~ 85,
                              `Age Group` == "90 and older" ~ 95,
                            ))

#### What's next? ####



         