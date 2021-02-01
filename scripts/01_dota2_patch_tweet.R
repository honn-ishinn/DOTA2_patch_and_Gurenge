#### Preamble ####
# Purpose: Clean the dota2 data downloaded from rtweet
# Author: Hong Shi
# Date: 1 February 2021
# Contact: lancehong.shi@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the raw data in "00_dota2_raw_data_import" and saved it to inputs/data


#### Workspace setup ####

library(tidyverse)

# Read in the raw data. 
raw_data <- readr::read_csv("inputs/data/raw_data_dota2.csv")

#### Selecting dota2 tweets related with patch information ####

# The earliest playable patch of DOTA2 is 6.70 released on 2010-12-24 as beta version. 
# The beta ended on 2013-07-09 and DOTA2 was officially released as a free to play game.
# Since then, each large patch with major game mechanic changes or new hero releases 
# usually increases the patch number by 0.01 ( e.g. from 6.72 to 6.73)
# Exception: the game patch update jump from 6.88 to 7.00 
# due to new era of original heroes and new mechanics, aside from its predecessor DOTA 
# And each small patch updates such as balance changes and bug fixes are released as 
# adding a suffix English letter in alphabetical order after the major patch.
# (e.g. from 7.23b to 7.23c)
# Exception: the first small update change based on large patch, lets say, 7.10,  
# could either increase the patch number from 7.10 to 7.10a or 7.10 to 7.10b (skipping the 7.10a as a patch number)

# So we could use regex to filter out tweets with patch update information.

# match the patch uodate pattern of:
# (1) starts with 6 or 7
# (2) followed by a dot
# (3) followed by 2 digits numbers from 0 to 9
# (4) may include a letter at last

dota2_patch_tweet <- raw_data %>% 
  filter(grepl("\\<[6,7]\\.[0-9]{2}.?\\>", raw_data$text))


#### Save cleaned data ####

write_csv(dota2_patch_tweet,"inputs/data/dota2_patch_tweet.csv")








