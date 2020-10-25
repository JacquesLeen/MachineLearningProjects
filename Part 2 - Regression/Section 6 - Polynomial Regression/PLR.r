#Polynomial Linear Regression (PLR)

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

# Fitting Simple Linear Regression to the dataset
lin_reg = lm(formula = Salary ~ Level,
               data = dataset)

#Predicting result with SLR
Y_pred = predict(lin_reg,data.frame(Level=6.5))

# Visualising the SLR results
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(lin_reg, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Salary vs Position_Level (SLR)') +
  xlab('Level') +
  ylab('Salary')

#Fitting Polynomial Regression Model to dataset
dataset$Level2 = (dataset$Level)^2
dataset$Level3 = (dataset$Level)^3
dataset$Level4 = (dataset$Level)^4
poly_reg = lm(formula = Salary ~ .,
              data = dataset)

# Predicting Result with PLR
Y_pred = predict(poly_reg,data.frame(Level=6.5,
                                     Level2= 6.5^2,
                                     Level3= 6.5^3,
                                     Level4= 6.5^4))

# Visualising the SLR results
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(poly_reg, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Salary vs Position_Level (PLR)') +
  xlab('Level') +
  ylab('Salary')