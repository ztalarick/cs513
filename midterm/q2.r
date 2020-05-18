rm(list=ls())

setwd("/home/zach/Documents/Junior/CS513/midterm")
data <- read.csv("COVID19_v3.csv")

x <- c(2, 3, 4, 5, 6, 7)

data[[4]] = factor(data[[4]])

#get summary for each column
for (column in x) {
  print(summary(data[[column]])) 
}

#frequency table for marital vs infected
table(data[[4]], data[[7]])

#scatter plot age vs marital
plot(data[[2]], data[[4]])

#scatter plot age vs months in hospital
plot(data[[2]], data[[6]])

#scatter plot marital vs months in hospital
plot(data[[4]], data[[6]])

#age
boxplot(data[[2]])
#marital status can't get a boxplot of a factor
#boxplot(data[[4]])
#months at hospital
boxplot(data[[6]])
