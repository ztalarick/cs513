install.packages("e1071")
install.packages("caret")
install.packages("class")

library(e1071)
library(class) 
library(caret)
library(zoo)
library(rpart)

rm(list=ls())
setwd("/home/zach/Documents/Junior/CS513/midterm")

data = read.csv("COVID19_v3.csv")
data = na.omit(data)

new_data = data[,c(2,3,5,6,7)]
#split into 70% training 30% testing
ind <- createDataPartition(new_data$Infected, p=0.70, list=FALSE)
inf_train <- new_data[ind,-5]
inf_test <- new_data[-ind,-5]

c <- new_data[ind,5]
c_test = new_data[-ind,5]
model = knn(inf_train , inf_test, c, k=5, prob=TRUE)

confusionMatrix(table(model , c_test))
