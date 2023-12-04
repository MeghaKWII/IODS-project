library(corrplot)
library(readr)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(GGally)
library(DT)
library(tibble)



BPRS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", sep =" ", header = T, stringsAsFactors = TRUE)

write.csv(BPRS, file = "BPRS")

dim(BPRS)
str(BPRS)

RATS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", sep =" ", header = T, stringsAsFactors = TRUE)

write.csv(RATS, file = "RATS")

dim(RATS)
str(RATS)
