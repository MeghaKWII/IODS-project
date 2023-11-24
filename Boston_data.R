options(repos = list(CRAN="http://cran.rstudio.com/"))
install.packages(c("MASS", "corrplot", "dplyr", "tidyverse", "ggplot2", "GGally", "DT", "readr" ))

library(MASS)
library(corrplot)
library(readr)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(GGally)
library(DT)

data("Boston")
str(Boston)
dim(Boston)

