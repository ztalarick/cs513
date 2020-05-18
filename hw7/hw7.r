#Zachary Talarick
#I pledge my honor that I have abided by the Stevens Honor System
#7.1 ANN Classification Model

rm(list=ls())
setwd("/home/zach/Documents/Junior/CS513/hw7")

data <- read.csv("wisc_bc_ContinuousVar.csv")

#normalize data
#Can use scaled normalizaton
#scaled_data<-scale(data)

#max min normilzation
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

#make diagnosis numeric, 1 = B and 2 = M
data$diagnosis=as.numeric(unlist(data[2]))

#remove ID to normalize the numeric data
maxmindf <- as.data.frame(lapply(data[-c(1)], normalize))
#after normalizing the diagnosis becomes 1 = cancer 0 = not cancer


#split data into 80% training and 20% testing 
# 1-456 for training and 456-570 for testing
train <- maxmindf[1:456, ]
test <- maxmindf[457:570, ]

#formula for NN
f <- diagnosis ~ radius_mean + texture_mean + perimeter_mean + area_mean+ smoothness_mean +  compactness_mean + concavity_mean + concave.points_mean + symmetry_mean + fractal_dimension_mean + radius_se + texture_se + perimeter_se + area_se + smoothness_se + compactness_se + concavity_se + concave.points_se + symmetry_se + fractal_dimension_se + radius_worst + texture_worst + perimeter_worst + area_worst + smoothness_worst + compactness_worst + concave.points_worst+ concavity_worst + symmetry_worst + fractal_dimension_worst

#Neural Network
library(neuralnet)
nn <- neuralnet(f, data=train, hidden=c(5,1), linear.output=FALSE, threshold=0.01)
nn$result.matrix
plot(nn)



