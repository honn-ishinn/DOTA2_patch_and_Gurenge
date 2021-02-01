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

# check if Japanese language is available, if not need to install it
tesseract_info()

#### 
