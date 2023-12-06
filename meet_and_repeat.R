library(corrplot)
library(readr)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(GGally)
library(DT)
library(tibble)
library(tidyr)



BPRS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", sep =" ", header = T, stringsAsFactors = TRUE)

write.csv(BPRS, file = "BPRS")

dim(BPRS)
str(BPRS)

RATS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", header = TRUE, sep = '\t')
write.csv(RATS, file = "RATS")

dim(RATS)
str(RATS)

BPRS<- read.csv("BPRS")
RATS <- read.csv("RATS")


BPRS$treatment <- factor(BPRS$treatment)
BPRS$subject <- factor(BPRS$subject)
BPRSL <-  pivot_longer(BPRS, cols=-c(treatment,subject),names_to = "weeks",values_to = "bprs") %>% arrange(weeks)
BPRSL <-  BPRSL %>% mutate(week = as.integer(substr(weeks,5,5)))

glimpse(BPRSL)

glimpse(BPRS)


RATS$ID <- factor(RATS$ID)
RATS$Group <- factor(RATS$Group)
RATSL <- pivot_longer(RATS, cols=-c(ID,Group), names_to = "WD",values_to = "Weight")  %>%  mutate(Time = as.integer(substr(WD,3,4))) %>% arrange(Time)

glimpse(RATSL)

