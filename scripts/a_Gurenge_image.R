#### Preamble ####
# Purpose: convert a image containing Japanese song "Gurenge" into text
# Author: Hong Shi
# Date: 1 February 2021
# Contact: lancehong.shi@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# Need to have downloaded the image "gurenge_kashi.jpg" and saved it to inputs/image


#### Workspace setpup ####

#install.packages("tesseract")

library(tesseract)
library(tidyverse)
library(here)

# check if Japanese language is available, if not need to install it
# based on https://cran.r-project.org/web/packages/tesseract/vignettes/intro.html

"jpn" %in% tesseract_info()$available

# tesseract_download("jpn")


#### Import the image and change it to text ####


# Huuuuuge thanks to Raffael in stackoverflow, solved my issue of saving the output txt file
# Based on the link:https://stackoverflow.com/questions/19877676/write-utf-8-files-from-r/20097594#20097594?newreg=302b07937be145109caf409e45654af3


gurenge_text <- tesseract::ocr(here::here("inputs/image/gurenge_kashi.jpg"), engine = tesseract("jpn"))

Encoding(gurenge_text) <- "UTF-16"
Encoding(gurenge_text)
write.table(gurenge_text,"outputs/gurenge_text/gurenge_kashi.txt",row.names=F,col.names=F,quote=F)

# a wrong example

wrong_text <- tesseract::ocr(here::here("inputs/image/gurenge_kashi.jpg"), engine = tesseract("jpn"))

Encoding(wrong_text)

cat(wrong_text, file = "outputs/gurenge_text/wrong_text.txt")





