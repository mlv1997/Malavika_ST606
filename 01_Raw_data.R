#loading packages
library(dplyr)
library(tidyverse)
load("ST606/irltim.Rdata")

raw_data <- as.data.frame(irltim)
View(raw_data)