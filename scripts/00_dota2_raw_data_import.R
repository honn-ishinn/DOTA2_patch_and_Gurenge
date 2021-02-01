#### Preamble ####
# Purpose: Use rtweet to get DOTA2 data
# Author: Hong Shi
# Date: 1 February 2021
# Contact: lancehong.shi@mail.utoronto.ca
# License: MIT
# Pre-requisites: None



#### Workspace set-up ####

# install.packages("rtweet")
library(rtweet)
library(tidyverse)


#### Get data ####

# get as most tweets as possible from the official "DOTA2" twitter account, the maximum is 3200 tweets

dota2_timeline <- get_timeline("DOTA2", n = 3200)

class(dota2_timeline$hashtags)
# Based on https://stackoverflow.com/questions/48024266/save-a-data-frame-with-list-columns-as-csv-file/48027618
# Need to convert the `hashtags` column from list to character to save the data as csv format

# Write a general-purpose function that converts any list columns to character type
set_lists_to_chars <- function(x) {
  if(class(x) == 'list') {
    y <- paste(unlist(x[1]), sep='', collapse=', ')
  } else {
    y <- x 
  }
  return(y)
}

#Apply function to tibble with list columns:

raw_dota2_timeline <- data.frame(lapply(dota2_timeline, set_lists_to_chars), stringsAsFactors = F)

# `hashtags` column converted to classes
class(raw_dota2_timeline$hashtags)


#### Save raw data ####

write_csv(raw_dota2_timeline,"inputs/data/raw_data_dota2.csv")
