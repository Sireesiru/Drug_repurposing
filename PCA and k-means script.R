# Read the dataset
  dat7a <- read.csv("dat7a.csv", sep = ",",row.names=1, header = TRUE, stringsAsFactors = FALSE)

# Perform PCA
  pc <- prcomp(dat7a)
  plot(pc)
# Obtain PCA biplot
  biplot(pc,cex=0.9,cex.axis=0.9, cex.lab=1.0)

# To generate the scree plot and know the number of PCs: 
  library(factoextra)
  fviz_eig(pc, ylim = c(0, 35), geom ="line")
     
# Plot PC1 vs. PC2(needs ggfortify package)
  fviz_pca_ind(pc,cex=0.5, pch=10, title =" ",labelsize=4, xlab="PC1",ylab="PC2")+theme(panel.border = element_rect(linetype = "solid", fill = NA),panel.grid.major=element_blank(),panel.grid.minor=element_blank())
 
# Save the 5 PCs separately which can be used for k-means
  comp <- data.frame(pc$x[,1:5])

# Determine the optimum number of clusters required for k-means clustering  
  set.seed(1)
  wss <- (nrow(dat7a)-1)*sum(apply(dat7a,2,var))
    for (i in 2:15) wss[i] <- sum(kmeans(dat7a,
                                     centers=i)$withinss)
    plot(1:15, wss, type="b", xlab="Number of Clusters",
    ylab="Within groups sum of squares")
	
# nbclust method of identifying optimum no of clusters:
  install.packages("NbClust")
  library(NbClust)
  fviz_nbclust(dat7a, kmeans, method = "wss")

# Use the above PCs(comp)to perform k-means clustering of drugs into 9 clusters
  set.seed(23)
  k <- kmeans(comp, 9, nstart=25, iter.max=1000)
  
#Save the pattern 
  set.seed(23)
  k1 <- kmeans(comp, 9, nstart=25, iter.max=1000)
 
#confirm the identical pattern
  identical(k, k1)
  
# Determine the clustering efficiency
  k 
  
# View 2d plot of the obtained clusters:
  fviz_cluster(k1, dat7a, ellipse.type = "norm", geom ="point", xlab="PC1",ylab="PC2", title =" ")
  
# View Multi 3D plot of the obtained clusters:
  install.packages("rgl")
  library(rgl)
  plot3d(comp$PC1, comp$PC2, comp$PC3, col=k1$clust, xlab = "PC1", ylab = "PC2", zlab = "PC3", cex=0.5, box = TRUE,type ="s", radius = 1.5, axes3d(edges = c("x--", "y--", "z-+")))  
  
# Sort the clusters based on their increasing size
  sort(table(k$clust))
 
  # Saves the cluster names
  clust <- names(sort(table(k$clust)))
  
  # Save every cluster separately 
  # First appeared Cluster  
  c1 <- row.names(dat7a[k$clust==clust[1],])
  # Second appeared Cluster
  c2 <- row.names(dat7a[k$clust==clust[2],])
  # Third appeared Cluster
  c3 <- row.names(dat7a[k$clust==clust[3],])
  # Fourth appeared cluster
  c4 <- row.names(dat7a[k$clust==clust[4],])
  # Fifth appeared cluster
  c5 <- row.names(dat7a[k$clust==clust[5],])
  # Sixth appeared Cluster
  c6 <- row.names(dat7a[k$clust==clust[6],])
  # Seventh appeared cluster
  c7 <- row.names(dat7a[k$clust==clust[7],])
  # Eigth appeared Cluster
  c8 <- row.names(dat7a[k$clust==clust[8],])
  # Nineth appeared cluster
  c9 <- row.names(dat7a[k$clust==clust[9],])  
  
  
