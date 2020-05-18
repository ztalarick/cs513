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

group = function(x){
  if(x<35){
    x = 0
  }
  if(x>= 35 && x<=50){
    x = 1
  }
  else{
    x = 2
  }
  return(x)
}

data = read.csv("COVID19_v3.csv")
data = na.omit(data)

#discretize Months At Hospital
data["Disc_MAH"] = as.numeric(data[,6] < 6) # 1 if the stay less than 6, 0 if the stay greater than 6

#discretize age  >35 = 0/35-50 = 1/<51 = 2   
data["Disc_Age"] = rollapply(data[,2],1, function(x)group(x))

#picks the correct columns for the descretized data
good_data = data[,c(3,4,5,8,9,7)]
good_data = data.frame(good_data)
good_data[,5] = factor(good_data[,5])
sapply(good_data, class)

#split data into training and test data sets at .7
training_index <- createDataPartition(y = good_data$Infected,p = 0.70,list = FALSE)
training <- good_data[training_index,]
testing <- good_data[-training_index,]

x_train = training[,1:5]
y_train = training$Infected

# grow tree
fit = rpart(y_train~ ., data = training, method="class",parms = list(split = "information"))
t_pred = predict(fit, testing, type="class")
t = testing["Infected"]

confMat <- table(testing$Infected, t_pred)
accuracy <- sum(diag(confMat))/sum(confMat)
accuracy

