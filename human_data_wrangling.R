

read.csv("human")

#Removing rows with missing values
human2 <- na.exclude(human)

#Renumbering levels for factors in case of dropped rows
human2 <- droplevels(human2) 

dim(human)
human2 <- human2[,c("country", "Edu2FM", "Labo.FM", "Edu.Exp", "Life.exp", "GNI", "MMR", "Ado.Birth", "Parli.rep" )]
dim(human2)

write.csv(human2, file = "human2")

str(human2)

# The dataset consists of the following variables:

# Country: These are the names of the countries for which the data has been presented
# Edu2FM: Refers to the proportion of females by males wieth secondary education
# Labo.FM: Refers to the ratio of women to that of men in the labour force
# Edu.Exp: Expected years of eductaion
# Life.exp:Refers to Life Expectancy 
# GNI: Refers to the per capita Gross National Income
# MMR: Maternal Mortality Ratio
# Ado.Birth: Refers to number of adolescent births
# Parli.rep: Refers to the representation of women in the parliament