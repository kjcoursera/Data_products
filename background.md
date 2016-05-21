---
title: "Background"
author: "KJ"
date: "May 18, 2016"
output: html_document
---

This is an interactive Shiny app developed for the Coursera Developing Data Products course. 

There are three tabs named as Classifiers and Description along with the current Back ground tab. 

In Classifier tab, We explore three models:  Recursive Partitioning and Regression Trees, Randomforest and Stochastic Gradient Boosting. Each model is automatically tuned using 10 repeats of 10-fold cross validation. By setting the same seed, each classifier gets the same data partition and repeats. The random sampling occurs within each class and  70% is allocated to training dataset and the remaining 30% to testing dataset.

The application allows the user to:

* Select the features to be included. 

* Select one of the classifier including rpart, randomforest and gradient that needed to predict the presence of diesese in the patient 

The description of the dataset features along with the references are provided in the Description tab

