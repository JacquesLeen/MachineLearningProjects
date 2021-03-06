#Decision Tree Regression


#import the dataset
#setwd("percorso_alla_cartella")
dataset = read.csv('Position_Salaries.csv') #name of the data set
dataset = dataset[, 2:3] # extrems of the coloumn i need

#splitting the data set into training and test
#install.packages('caTools')
#library(caTools)
#set.seed(123)
#split = sample.split(dataset$Purchased, SplitRatio = 0.8)#possibily different ratio
#training_set = subset(dataset, split == TRUE)
#test_set = subset(dataset, split == FALSE)

#feature scaling
# training_set[,2:3] = scale(training_set[,2:3])
# test_set[,2:3] = scale(test_set[,2:3])

#Fitting Regression Model to dataset
library(rpart)
regressor = rpart(formula = Salary ~.,
                  data = dataset,
                  control = rpart.control(minsplit=1))

# Predicting Result with Decision tree
Y_pred = predict(regressor,data.frame(Level=6.5))

# Visualising the Decision Tree results
library(ggplot2)
X_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = X_grid, y = predict(regressor, newdata = data.frame(Level = X_grid))),
            colour = 'blue') +
  ggtitle('Salary vs Position_Level (Decision Tree Model)') +
  xlab('Level') +
  ylab('Salary')