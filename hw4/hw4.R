rm(list=ls())

library(e1071)
library(class) 

#load data
setwd("/home/zach/Documents/Junior/CS513/hw4")
data <- read.csv("breast-cancer-wisconsin.data.csv")
#fix data
na.omit(data)

#Setting outcome variables as categorical
data$Class <- factor(data$Class, levels = c(2,4), labels = c("False", "True"))

nBayes_all <- naiveBayes(Class ~., data =data)
category_all<-predict(nBayes_all, data)

table(NBayes_all=category_all,Class=data$Class)

NB_wrong<-sum(category_all!=data$Class)

NB_error_rate<-NB_wrong/length(category_all)
