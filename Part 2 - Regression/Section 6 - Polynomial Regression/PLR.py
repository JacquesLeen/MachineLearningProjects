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
#usiamo due modelli per fare comparazione

#Fitting Linear Regression to data set
from sklearn.linear_model import LinearRegression
Lin_reg = LinearRegression()
Lin_reg.fit(X,Y)


#Fitting Polynomial Regression to data set
#trasformo prima la matrice originale in una matrice con le potenze
from sklearn.preprocessing import PolynomialFeatures
Poly_reg = PolynomialFeatures(degree=4)
X_poly = Poly_reg.fit_transform(X)
#faccio una MLR sulla matrice nuova
Lin_reg2 = LinearRegression()
Lin_reg2.fit(X_poly, Y)

#Visualising SLR Results
plt.scatter(X, Y, color = 'red')
plt.plot(X, Lin_reg.predict(X), color = 'blue')
plt.title('Prediciton with SLR')
plt.xlabel('Level')
plt.ylabel('Salary')
plt.show()


#Visualising PLR Results
X_grid = np.arange(min(X), max(X), 0.1)
X_grid = X_grid.reshape(len(X_grid),1)
plt.scatter(X, Y, color = 'red')
plt.plot(X_grid, Lin_reg2.predict(Poly_reg.fit_transform(X_grid)), color = 'blue')
plt.title('Prediciton with PLR')
plt.xlabel('Level')
plt.ylabel('Salary')
plt.show()

#Prediction of result with SLR
Lin_reg.predict(6.5)


#Prediction of result with PLR
Lin_reg2.predict(Poly_reg.fit_transform(6.5))

