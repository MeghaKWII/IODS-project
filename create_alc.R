# Megha Khanduri 11-11-2023 Assignment 3

install.packages("boot")
install.packages("readr")
install.packages("dplyr")
install.packages("tidyverse")
install.packages("ggplot2")
install.packages("GGally")
library(boot)
library(readr)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(GGally)


#importing data
setwd("C:/Users/Megha Khanduri/OneDrive/Desktop/maximum effort/ELP Ganga Basin/courses/IODS/IODS-project/data")
stu_mat <- read.csv("C:/Users/Megha Khanduri/OneDrive/Desktop/maximum effort/ELP Ganga Basin/courses/IODS/IODS-project/data/student-mat.csv",sep = ";", header = TRUE)
View(stu_mat)
stu_por <- read.csv("C:/Users/Megha Khanduri/OneDrive/Desktop/maximum effort/ELP Ganga Basin/courses/IODS/IODS-project/data/student-por.csv",sep = ";", header = TRUE)
View(stu_por)

#Creating subsets for analysis
por<- stu_por[,!names(stu_por) %in% c("paid", "failures", "absences", "G1", "G2", "G3")]
View(por)
str(por)
dim(por)
s_mat<- stu_mat[,!names(stu_mat) %in% c("paid", "failures", "absences", "G1", "G2", "G3")]
View(s_mat)
str(s_mat)
dim(s_mat)
free_cols <- c("failures","paid","absences","G1","G2","G3")
join_cols <- setdiff(colnames(por), colnames(s_mat))

#Joining columns
math_por <- inner_join(math, por, by = join_cols)
View(math_por)
str(math_por)
dim(math_por)

# Work with the exercise in this chunk, step-by-step. Fix the R code!
# dplyr, math_por, join_by are available

# print out the column names of 'math_por'


# create a new data frame with only the joined columns
free_cols <- c("failures","paid","absences","G1","G2","G3")
join_cols <- setdiff(colnames(por), free_cols)
math_por <- inner_join(math, por, by = join_cols, suffix = c(".math", ".por"))
alc <- select(math_por, all_of(join_cols))
for(col_name in free_cols) {
  two_cols <- select(math_por, starts_with(col_name))
  first_col <- select(two_cols, 1)[[1]]
  if(is.numeric(first_col)) {
    alc[col_name] <- round(rowMeans(two_cols))
  } else {
    alc[col_name] <- first_col
  }
}
glimpse(alc)

write.csv(alc, file = "alc.csv")