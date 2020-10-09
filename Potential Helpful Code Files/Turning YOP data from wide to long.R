library(janitor)
library(reshape2)
yop <- yop %>%row_to_names(row_number = 1)

yop <- read.csv("~/GitHub/Theophanes-Geography-Project/Datasets/Years_Place_Settlements GIS (CSV version).csv", header=FALSE)
yop[,21:550][is.na(yop[,21:550])] <- 0
yop_long <- melt(yop, id.vars= colnames(yop[,1:20]))
yop$`Total Instances(sum)` <- as.numeric(yop$`Total Instances(sum)`)
       
write.csv(yop_long, "yop_long.csv")   
sum(as.numeric(as.character(yop_long$value)))       
sum(as.numeric(yop$`Total Instances(sum)`))
