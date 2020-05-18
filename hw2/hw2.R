library(plyr)
library(zoo)

setwd("/home/zach/Documents/Junior/CS513/hw2")
cancer_data <- read.csv("breast-cancer-wisconsin.data.csv")

x <- c(2,3,4,5,6,7,8,9,10)
for (column in x) {
  print(summary(cancer_data[[column]])) 
  
}

for(i in 1:ncol(cancer_data)){ #fixing missing values, must use NA
  cancer_data[is.na(cancer_data[,i]), i] <- mean(cancer_data[,i], na.rm = TRUE)
}

count(cancer_data, "Class")
count(cancer_data, "F6")
plot(cancer_data$F1, cancer_data$F6)
hist(cancer_data$F7)
hist(cancer_data$F9)

rm(list = ls())

cancer_data <- read.csv("breast-cancer-wisconsin.data.csv")
cancer_data = subset(cancer_data, F6!="NA")
