#Regression Template

#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Nov 29 11:24:33 2018

@author: giacomolini
"""

#Polynomial Linear Regression


#importing libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

#Import a dataset
dataset = pd.read_csv('Position_Salaries.csv') #name of the dataset
X = dataset.iloc[:, 1:-1].values 
Y = dataset.iloc[:, 2].values #modify extrems if necessary

#splitting into training and test datasets
"""from sklearn.model_selection import train_test_split
X_train, X_test, Y_train, Y_test = train_test_split(X,Y, test_size = 0.2, random_state =0)"""
#possibly different test_size


#feature scaling
"""from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)
sc_Y = StandardScaler()
Y_train = sc_Y.fit_transform(Y_train)
"""
#Fitting the Regression to data set
#create regressor here


#Prediction of result with Regression Model
Y_pred = regressor.predict(6.5)


#Visualising Reegression Results
X_grid = np.arange(min(X), max(X), 0.1)
X_grid = X_grid.reshape(len(X_grid),1)
plt.scatter(X, Y, color = 'red')
plt.plot(X_grid, regressor.predict(X_grid), color = 'blue')
plt.title('Prediciton with Regression Model')
plt.xlabel('Level')
plt.ylabel('Salary')
plt.show()

