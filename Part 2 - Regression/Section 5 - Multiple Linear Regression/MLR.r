#Multiple Linear Regression


#import the dataset
dataset = read.csv('50_Startups.csv') #name of the data set
#dataset = dataset[, 2:3] # extrems of the coloumn i need

# Encoding categorical data
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1, 2, 3))
#splitting the data set into training and test
#install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)#possibily different ratio
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#feature scaling
# training_set[,2:3] = scale(training_set[,2:3])
# test_set[,2:3] = scale(test_set[,2:3])

#Fitting MLR to Training set
regressor = lm(formula = Profit ~ .,
               data= training_set)

#Predicting Test set Results
y_pred = predict(regressor, newdata = test_set)

#Building Optimal Model with Backward Elimination
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
               data= dataset)
summary(regressor)
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend ,
               data= dataset)
summary(regressor)
regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend ,
               data= dataset)
summary(regressor)
regressor = lm(formula = Profit ~ R.D.Spend,
               data= dataset)
summary(regressor)
