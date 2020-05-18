rm(list=ls())
setwd("/home/zach/Documents/Junior/CS513/final")
data <- read.csv("Admission_cat.csv")

#get rid of Applicant ID
data <- data[c(-1)]
data$ADMIT= as.factor(data$ADMIT)

#split into train and test
index<-sort(sample(nrow(data),round(.3*nrow(data))))
training<-data[-index,]
test<-data[index,]


library(randomForest)
library(caret)

#### Random Forest Model ####
rf = randomForest(x = training[-1] ,y = training$ADMIT, ntree = 500)

# Random Forest Prediction
rf.predict = predict(rf, newdata = test[-1])

# Random Forest Confusion Matrix

rf.confusion = confusionMatrix(rf.predict, test$ADMIT)
rf.confusion

#accuraccy is .65