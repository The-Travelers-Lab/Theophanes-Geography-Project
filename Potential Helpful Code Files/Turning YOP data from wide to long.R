#importing libraries
library(janitor)
library(reshape2)

#importing csv data from GitHub repository on local desktop 
yop <- read.csv("~/GitHub/Theophanes-Geography-Project/Datasets/Years_Place_Settlements GIS (CSV version).csv", header=FALSE)

#when column names are being imported as the first row, use this to make the dataset's first row the column names 
yop <- yop %>%row_to_names(row_number = 1)

#replace all NAs with 0s to make future calculations easier 
yop[,21:550][is.na(yop[,21:550])] <- 0

#create an long version with years over place 
yop_long <- melt(yop, id.vars= colnames(yop[,1:20]))

#below is an sanity check to check total instances in YOP wide against YOP long - their sums should be the same 
sum(as.numeric(as.character(yop_long$value)),na.rm = T)       
sum(as.numeric(yop$Total_Instances_Sum),na.rm = T)

#exporting the long YOP dataset to an csv file for use outside of R
write.csv(yop_long, "yop_long.csv")

