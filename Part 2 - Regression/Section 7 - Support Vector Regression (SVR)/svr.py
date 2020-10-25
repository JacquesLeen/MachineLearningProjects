#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Dec  2 11:28:52 2018

@author: giacomolini
"""

#SVR


#importing libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

#Import a dataset
dataset = pd.read_csv('Position_Salaries.csv') #name of the dataset
X = dataset.iloc[:, 1:2].values 
Y = dataset.iloc[:, 2].values #modify extrems if necessary

#splitting into training and test datasets
"""from sklearn.model_selection import train_test_split
X_train, X_test, Y_train, Y_test = train_test_split(X,Y, test_size = 0.2, random_state =0)"""
#possibly different test_size


#feature scaling
from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
sc_Y = StandardScaler()
Y= Y.reshape(10,1)
X = sc_X.fit_transform(X)
Y = sc_Y.fit_transform(Y)

#Fitting the SVR to data set
from sklearn.svm import SVR
regressor = SVR(kernel ='rbf')
regressor.fit(X, Y)


#Prediction of result with Regression Model
Y_pred = sc_Y.inverse_transform(regressor.predict(sc_X.transform(np.array([[6.5]]))))


#Visualising Reegression Results
X_grid = np.arange(min(X), max(X), 0.1)
X_grid = X_grid.reshape(len(X_grid),1)
plt.scatter(X, Y, color = 'red')
plt.plot(X_grid, regressor.predict(X_grid), color = 'blue')
plt.title('Prediciton with SVR Model')
plt.xlabel('Level')
plt.ylabel('Salary')
plt.show()