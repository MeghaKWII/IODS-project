

read.csv("human")
human2 <- na.exclude(human)
human2 <- droplevels(human2) 
dim(human)
human2 <- human2[,c("country", "Edu2FM", "Labo.FM", "Edu.Exp", "Life.exp", "GNI", "MMR", "Ado.Birth", "Parli.rep" )]
dim(human2)