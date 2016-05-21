---
title: "Statlog Heart Dataset Description"
author: "KJ"
date: "May 18, 2016"
output: html_document
---


The dataset has been taken from the UCI Repository Of Machine Learning Databases at
http://archive.ics.uci.edu/ml/.

Data contains 13 attributes (which have been extracted from
a larger set of 75)       


Attribute Information:
------------------------
      -- 1. age       
      -- 2. sex       
      -- 3. chest pain type  (4 values)       
      -- 4. resting blood pressure  
      -- 5. serum cholestoral in mg/dl      
      -- 6. fasting blood sugar > 120 mg/dl       
      -- 7. resting electrocardiographic results  (values 0,1,2) 
      -- 8. maximum heart rate achieved  
      -- 9. exercise induced angina    
      -- 10. oldpeak = ST depression induced by exercise relative to rest   
      -- 11. the slope of the peak exercise ST segment     
      -- 12. number of major vessels (0-3) colored by flourosopy        
      -- 13.  thal: 3 = normal; 6 = fixed defect; 7 = reversable defect     

Attributes types
-----------------

* Real: 1,4,5,8,10,12
* Ordered:11,
* Binary: 2,6,9
* Nominal:7,3,13

Variable to be predicted
------------------------
Absence (1) or presence (2) of heart disease

Cost Matrix

	 abse  pres
absence	  0	1
presence  5	0

where the rows represent the true values and the columns the predicted.

No missing values.

270 observations



Papers that cite this dataset
-----------------------------
Gavin Brown. Diversity in Neural Network Ensembles. The University of Birmingham. 2004.

Igor Kononenko and Edvard Simec and Marko Robnik-Sikonja. Overcoming the Myopia of Inductive Learning Algorithms with RELIEFF. Appl. Intell, 7. 1997. 

Elena Smirnova and Ida G. Sprinkhuizen-Kuyper and I. Nalbantis and b. ERIM and Universiteit Rotterdam. Unanimous Voting using Support Vector Machines. IKAT, Universiteit Maastricht. 

Alexander K. Seewald. Dissertation Towards Understanding Stacking Studies of a General Ensemble Learning Scheme ausgefuhrt zum Zwecke der Erlangung des akademischen Grades eines Doktors der technischen Naturwissenschaften. 



