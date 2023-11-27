library(readr)
hd <- read_csv("https://raw.githubusercontent.com/KimmoVehkalahti/Helsinki-Open-Data-Science/master/datasets/human_development.csv")
gii <- read_csv("https://raw.githubusercontent.com/KimmoVehkalahti/Helsinki-Open-Data-Science/master/datasets/gender_inequality.csv", na = "..")

dim(hd)
str(hd)
summary(hd)

dim(gii)
str(gii)
summary(gii)

names(hd)

#Renaming the human dataset columns:

names(hd)[1] <- "HDI_rank"
names(hd)[2] <- "country"
  names(hd)[3] <- "HDI"
  names(hd)[4] <- "Life.exp"
  names(hd)[5] <- "Edu.Exp"
  names(hd)[6] <- "Edu.years"
  names(hd)[7] <-"GNI"
  names(hd)[8] <- "GNI-HDI"
hd

names(gii)

names(gii)[1] <- "GII_rank"
names(gii)[2] <- "country"
names(gii)[3] <- "GII"
names(gii)[4] <- "MMR"
names(gii)[5] <- "Ado.Birth"
names(gii)[6] <- "Parli.rep"
names(gii)[7] <-"Edu2.F"
names(gii)[8] <- "Edu2.M"
names(gii)[9] <-"Labo.F"
names(gii)[10] <- "Labo.M"
gii
