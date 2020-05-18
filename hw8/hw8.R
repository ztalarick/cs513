library(readr)
library(ggplot2)

setwd("/home/zach/Documents/Junior/CS513/hw7")
#read data
data <- read.csv("wisc_bc_ContinuousVar.csv")

data = data.frame(data)
#clean data
data = na.omit(data)

#8.1
#clustering
clusters <- hclust(dist(data[, 3:32]))

plot(clusters)

clusterCut <- cutree(clusters,5)
table(clusterCut, data$diagnosis)


# 8.2
ggplot(data, aes(concavity_mean, perimeter_mean, color = diagnosis)) + geom_point()

set.seed(20)
dataCluster <- kmeans(data[, 3:32], 2, nstart = 50)
dataCluster
table(dataCluster$cluster, data$diagnosis)
