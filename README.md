# Drug_repurposing  
# Introduction
The current work is about unsupervised machine learning studies of approved drugs to identify drugs which can be repurposed for new indications. This work is carried out using two tools namely Unsupervised ML tools which generated drug clusters and PASS 2017 which gave all the predicted biological activities of the drugs.The unsupervised ML work involved PCA and k-means clustering carried out in R 3.6.2 environment while the PASS analysis is done only in excel. Excel VB macro scripts are used for analysing PASS results.

# Contents of the folder
The folder contains all the results obtained in the study. 
It contains 
1. The scaled input file dat7a.csv containing the 1079 2D properties of the 1671 drugs considered in the study.
2. The R script used for PCA and k-means clustering.
3. The loadings and percentage contribution files of the 1079 variables on the first five principal components in the form of xls files.
4. The VB macro scripts (Annexure-A and Annexure-B).
5. PASS results xls file which contains the final repurposable indications identified in the study and the graphs.
6. The drugs in each of the nine cluster are given in the C1-C9 cluster.xls file.

# Requirements
1. R-version 3.6.2
2. PASS 2017 software
