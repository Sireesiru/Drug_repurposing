# Drug_repurposing  
# Introduction
The current work is about unsupervised machine learning studies of approved drugs to identify repurposable drugs for new indications. This work is carried out using two tools namely Unsupervised ML tools which generated drug clusters and PASS 2017 which gave all the predicted biological activities of the drugs.The unsupervised ML work involved PCA and k-means clustering which are carried out in R 3.6.2 environment and R-studio while the PASS analysis is done only in excel. The scripts for analysing PASS results are excel VB macro scripts.

# Contents of the folder
The folder contains all the results obtained in the study. 
It contains the scaled input file dat3.csv containing the 1052 2D properties of the 1562 drugs considered in the study.
It contains the R script used for PCA and k-means clustering.
It also contains the loadings and percentage contribution files of the 1052 variables on the first five principal components in the form of xls files.
The xml files of the two excel VB macro scripts(Annexure-A and Annexure-B).
PASS results xls file which contains the final repurposable indications identified in the study and the graphs.
The drugs in each of the nine cluster are given in the C1-C9 cluster.xls file.

# Requirements
1. R-version 3.6.2
2. PASS 2017 software
