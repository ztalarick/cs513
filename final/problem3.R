#problem3
rm(list=ls())
setwd("/home/zach/Documents/Junior/CS513/final")
data <- read.csv("Admission_cat.csv")

data <- data[c(-1)]

data$ADMIT= as.factor(data$ADMIT)

#split into train and test
index<-sort(sample(nrow(data),round(.3*nrow(data))))
training<-data[-index,]
test<-data[index,]

#training_factor <- as.factor(unlist(training))

library('C50')

C50_class <- C5.0(x = training[-1], y = training$ADMIT)
summary(C50_class )
#plot(C50_class)

#test model
C50_predict<-predict( C50_class ,test[-1] , type="class" )

library(caret)

C50_confusion = confusionMatrix(C50_predict, test$ADMIT)
C50_confusion
#accurraccy is .667


