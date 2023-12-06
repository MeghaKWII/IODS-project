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

glimpse(RATS)


# The long form decreases the number of variables in both the datasets, and allows us to identify which variables account for repeated measurements. For example, multiple observations have been taken for the different weeks and times in the datasets BPRS and RATS, respectively.


str(BPRS)

dim(BPRSL)
str(BPRSL)

# tibble [360 × 5] (S3: tbl_df/tbl/data.frame)
# $ treatment: Factor w/ 2 levels "1","2": 1 1 1 1 1 1 1 1 1 1 ...
# $ subject  : Factor w/ 20 levels "1","2","3","4",..: 1 2 3 4 5 6 7 8 9 10 ...
# $ weeks    : chr [1:360] "week0" "week0" "week0" "week0" ...
# $ bprs     : int [1:360] 42 58 54 55 72 48 71 30 41 57 ...
# $ week     : int [1:360] 0 0 0 0 0 0 0 0 0 0 ...




dim(RATSL)
str(RATSL)


# tibble [192 × 5] (S3: tbl_df/tbl/data.frame)
#  $ ID    : Factor w/ 16 levels "1","2","3","4",..: 1 2 3 4 5 6 7 8 9 10 ...
# $ Group : Factor w/ 3 levels "1","2","3": 1 1 1 1 1 1 1 1 2 2 ...
# $ WD    : chr [1:192] "WD1" "WD1" "WD1" "WD1" ...
# $ Weight: int [1:192] 240 225 245 260 255 260 275 245 410 405 ...
# $ Time  : int [1:192] 1 1 1 1 1 1 1 1 1 1 ...


write.csv(BPRSL, file = "BPRSL")
write.csv(RATSL, file = "RATSL")
