#problem 1

rm(list=ls())
setwd("/home/zach/Documents/Junior/CS513/final")
data <- read.csv("Admission.csv")

#remove Rank and ApplicantID
data <- data[c(-1, -5)]

data_clustering <- data[c(-1)]

#Part 1 k_means algorithm
k_means <- kmeans(data_clustering, centers=2, nstart=25)
str(k_means)

# Tabulate the clustered rows against the “ADMIT” column.
table(k_means$cluster, data$ADMIT)

#Part 2 hierarchical clustering

h_cluster <- hclust(dist(data_clustering))
pruned <- cutree(h_cluster, 2)
str(h_cluster)

# Tabulate the clustered rows against the “ADMIT” column.
table(pruned, data$ADMIT)
