#KNN

#data processing

#import the dataset
#setwd("percorso_alla_cartella")
dataset = read.csv('Social_Network_Ads.csv') #name of the data set
dataset = dataset[, 3:5] # extrems of the coloumn i need

#splitting the data set into training and test
#install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)#possibily different ratio
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#feature scaling
training_set[,1:2] = scale(training_set[,1:2])
test_set[,1:2] = scale(test_set[,1:2])

#Fitting KNN and predicting test set results
library(class)
y_pred = knn(train = training_set[, -3],
           test= test_set[,-3],
           cl = training_set[,3],
           k= 5)

#Confusion Matrix
cm  = table(test_set[,3],y_pred)

#Visualisation

#install.packages('ElemStatLearn')
library(ElemStatLearn)
 set= training_set
 X1 = seq(min(set[,1]) -1, max(set, 1) +1, by= 0.01)
 X2 = seq(min(set[,2]) -1, max(set, 2) +1, by= 0.01)
 grid_set = expand.grid(X1,X2)
 colnames(grid_set)=c('Age','EstimatedSalary')
 y_grid = knn(train = training_set[, -3],
                test= grid_set,
                cl = training_set[,3],
                k= 5)
 plot(set[,-3],
      main='KNN (Training Set)',
      xlab='Age', ylab='Est. Salary',
      xlim= range(X1), ylim= range(X2))
 contour(X1, X2, matrix(as.numeric(y_grid),length(X1), length(X2)), add = TRUE)
 points(grid_set, pch ='.', col= ifelse(y_grid==1,'springgreen','tomato'))
 points (set, pch=21, bg = ifelse(set[, 3]==1, 'green4', 'red3'))


 set= test_set
 X1 = seq(min(set[,1]) -1, max(set, 1) +1, by= 0.01)
 X2 = seq(min(set[,2]) -1, max(set, 2) +1, by= 0.01)
 grid_set = expand.grid(X1,X2)
 colnames(grid_set)=c('Age','EstimatedSalary')
 y_grid = knn(train = training_set[, -3],
                test= grid_set,
                cl = training_set[,3],
                k= 5)
 plot(set[,-3],
      main='KNN (Test Set)',
      xlab='Age', ylab='Est. Salary',
      xlim= range(X1), ylim= range(X2))
 contour(X1, X2, matrix(as.numeric(y_grid),length(X1), length(X2)), add = TRUE)
 points(grid_set, pch ='.', col= ifelse(y_grid==1,'springgreen','tomato'))
 points (set, pch=21, bg = ifelse(set[, 3]==1, 'green4', 'red3'))
 