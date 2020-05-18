#Zachary Talarick
#I pledge my honor that I have abided by the Stevens Honor System
#6.1 C5.0 Classification Model
rm(list=ls())
setwd("/home/zach/Documents/Junior/CS513/hw6")
data <- read.csv("breast-cancer-wisconsin.data.csv")

#fix data
data2 <- na.omit(data)

#split into test and training data
index<-sort(sample(nrow(data2),round(.25*nrow(data2))))
training<-data2[-index,]
test<-data2[index,]

#make training a factor
training_factor <- as.factor(unlist(training))

#library with C.50 Classisfication Model
#install.packages("C50", repos="http://R-Forge.R-project.org")
library('C50')

#Classification Model
C50_class <- C5.0(x = training[11], y = training_factor)
summary(C50_class )
#plot(C50_class)

C50_predict<-predict( C50_class ,test , type="class" )
table(actual=test[,4],C50=C50_predict)
wrong<- (test[,4]!=C50_predict)
c50_rate<-sum(wrong)/length(test[,4])
c50_rate

#6.2 Random Forrest Classification Model
rm(list=ls())
setwd("/home/zach/Documents/Junior/CS513/hw6")
data <- read.csv("breast-cancer-wisconsin.data.csv")

#fix data
data2 <- na.omit(data)

#split into test and training data
index<-sort(sample(nrow(data2),round(.25*nrow(data2))))
training<-data2[-index,]
test<-data2[index,]


#random forrest package
#install.packages("randomForest")
library(randomForest)

model1 <- randomForest(Class ~ ., data = training, importance = TRUE)
str(model1)

model2 <- randomForest(Class ~ ., data = training, ntree = 500, mtry = 6, importance = TRUE)
str(model2)

predTrain <- predict(model1, training, type = "class")

table(predTrain, training$Class) 
predValid <- predict(model1, test, type = "class")
mean(predValid == test$Class) #model is terrible only predicts 1/3 of the time                    
table(predValid, test$Class)

predTrain2 <- predict(model2, training, type = "class")

table(predTrain2, training$Class) 
predValid2 <- predict(model2, test, type = "class")
mean(predValid2 == test$Class) #slightly better model, still not great                    
table(predValid2, test$Class)
