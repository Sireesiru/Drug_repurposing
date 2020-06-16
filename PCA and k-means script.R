# Read the dataset
  dat3 <- read.csv("dat3.csv", sep = ",",row.names=1, header = TRUE, stringsAsFactors = FALSE)

# Perform PCA
  > pc <- prcomp(dat3)
  > plot(pc)
# Obtain PCA biplot
  > biplot(pc,scale = TRUE, cex=0.7)

# To generate the scree plot and know the number of PCs: 
  > library(factoextra)
  > fviz_eig(pc, ylim = c(0, 35), geom ="line")
     
# Plot PC1 vs. PC2(needs ggfortify package)
  > library(ggfortify)
  > autoplot(prcomp(dat3), label = TRUE, label.size = 3)
  
# Save the 5 PCs separately which can be used for k-means
  > comp <- data.frame(pc$x[,1:5])

# Determine the optimum number of clusters required for k-means clustering  
  > wss <- (nrow(dat3)-1)*sum(apply(dat3,2,var))
    for (i in 2:15) wss[i] <- sum(kmeans(dat3,
                                     centers=i)$withinss)
    plot(1:15, wss, type="b", xlab="Number of Clusters",
    ylab="Within groups sum of squares")
# nbclust method of identifying optimum no of clusters:
  > install.packages("NbClust")
  > library(NbClust)
  > fviz_nbclust(dat3, kmeans, method = "wss")

# Use the above PCs(comp)to perform k-means clustering of drugs into 9 clusters
  k <- kmeans(comp, 9, nstart=25, iter.max=1000)

# Determine the clustering efficiency
  > k 
  
# View 2d plot of the obtained clusters:
  > fviz_cluster(k, dat3, ellipse.type = "norm", geom ="point")
  
# View Multi 3D plot of the obtained clusters:
  > library(rgl)
  > plot3d(comp$PC1, comp$PC2, comp$PC3, col=k$clust)

# For better visualization of the 3D plot of the obtained clusters:
  > plot3d(comp$PC1, comp$PC2, comp$PC3, col=k$clust, cex=0.5, box = TRUE,type ="s", radius = 1.5)  

# Sort the clusters based on their increasing size
  > sort(table(k$clust))

# Saves the cluster names
  clust <- names(sort(table(k$clust)))

# Save every cluster separately
# Eighth cluster
  c8 <- row.names(dat3[k$clust==clust[1],])
# Fourth Cluster
  c4 <- row.names(dat3[k$clust==clust[2],])
# Ninth Cluster
  c9 <- row.names(dat3[k$clust==clust[3],])
# Fifth Cluster
  c5 <- row.names(dat3[k$clust==clust[4],])
# Seventh Cluster
  c7 <- row.names(dat3[k$clust==clust[5],])
# Second Cluster
  c2 <- row.names(dat3[k$clust==clust[6],])
# Sixth Cluster
  c6 <- row.names(dat3[k$clust==clust[7],])
# First Cluster
  c1 <- row.names(dat3[k$clust==clust[8],])
# Third Cluster
  c3 <- row.names(dat3[k$clust==clust[9],])