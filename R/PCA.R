library(corrplot)
library(ggplot2)
library(ggpubr)

library(dplyr)


iris <-read.csv("C_iris.csv", header=T,row.names =1)

head(iris)

iris_numeric <- iris %>% select(-Species)

iris_scaled <- scale(iris_numeric)

head(iris_scaled)

pca_result <- prcomp(iris_scaled, center = TRUE, scale. = TRUE)

summary(pca_result)

pca_result$x

pca_result$rotation

pca_scores <- as.data.frame(pca_result$x)
pca_scores$Species <- iris$Species

ggplot(pca_scores, aes(x = PC1, y = PC2, color = Species)) +
  geom_point(size = 2) +
  labs(title = "PCA: Scatterplot of PC1 vs PC2", x = "PC1", y = "PC2") +
  theme_minimal()

head(pca_scores)

write.csv(pca_scores, "C_pca_scores.csv", row.names = FALSE)
