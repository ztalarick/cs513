library(kknn)
setwd("/home/zach/Documents/Junior/CS513/hw2")
rm(list=ls())
cancer_data <- read.csv("breast-cancer-wisconsin.data.csv")

cancer_data = subset(cancer_data, F6!="NA")


idx<-sort(sample(nrow(cancer_data),as.integer(.7*nrow(cancer_data))))
training<-cancer_data[idx,]
test<-cancer_data[-idx,]

predict_k3 <- kknn(formula=Class~., training, test[,-11], k=3, kernel ="rectangular"  )
predict_k5 <- kknn(formula=Class~., training, test[,-11], k=5, kernel ="rectangular"  )
predict_k7 <- kknn(formula=Class~., training, test[,-11], k=7, kernel ="rectangular"  )

fit <- fitted(predict_k3)
table(Actual=test$Class,Fitted=fit)

fit <- fitted(predict_k5)
table(Actual=test$Class,Fitted=fit)

fit <- fitted(predict_k7)
table(Actual=test$Class,Fitted=fit)

firstlastcol<-cbind(cancer_data[,1],cancer_data[,5])


