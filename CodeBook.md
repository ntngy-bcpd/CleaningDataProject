Getting and Cleaning Data
Project

CODE BOOK

by Ntngy

A. Introduction

The project of "Getting and Cleaning Data" class is to collect the 
data from a wearable computing study on human activity recognition 
using smartphones. A subset of the data is selected and grouped to 
create a tidy data set for later analysis. See this link:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

for further information on the study.

The data for the project is at this link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data includes accelerometer information of thirty human subjects 
performing six activities over the test period. This project only 
includes the means and standard deviations of the collected variables
in the combined training and test data sets.

B. Method

Once the data mentioned in the introduction is downloaded and 
unzipped. The following steps are applied to the data.

	1. Combine the training data set by columns in this order:
	   subject_training, X_training, y_training
	   where:
	      subject: an integer label (1 to 30) for each subject,
	      X: a set of 561 accelerometer variables,
	      y: an interge label (1 to 6) for six activities.
	   Descriptions of accelerometer variables and activities are 
	   in the data sets.
	   
	2. Combine the test data set by columns in this order:
	   subject_test, X_test, y_test
	   where the variables have the same meanings as in (1).
	   
	3. Combine the training and test data sets by row because 
	   they have the same set of columns.
	   
	4. Select the first and the last columns of the data set in (3) 
	   for subjects and activities. Select the columns that have 
	   "mean()" and "std()" in their variable names to be included 
	   in this project. These are the means and standard deviations 
	   estimated from the accelerometer signals.
	   
	   The variables with "mean" but not "mean()" in their names are 
	   excluded in this project. For example,  fBodyBodyGyroMag-meanFreq() 
	   and angle(X,gravityMean) are excluded.
	   
	5. Replace the integer labels in the data set in (4) for 
	   descriptive labels as in the activity_labels.txt file 
	   of the original data set.
	   
	6. Name the first column as "Subject" and the last column as
	   "Activity" in the data set in (5). Name the remaining columns 
	   according to the corresponding features described in the 
	   features.txt file of the original data set.
	   
	7. Group the data set in (6) by the average of each variable for
	   each subject and each activity.
	   
	8. Write the data set in (7) as a text file "tidyData.txt" 
	   without using row names. This is the tidy data set for 
	   this project. The tidy data set has 68 variables and 180
	   rows.
       
C. Variables

Following are descriptions of the 68 variables in the tidy data set.

	1. Subject: integer, 1 to 30, indicates one of 30 human subjects 
	   in the study.
	   
	2. Activity: factor, indicates one of six activities: LAYING,
	   SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS,
	   WALKING_UPSTAIRS.
	   
	3 to 68: Variable names are combined as follows:
	   
	   signal-calc()-XYZ
	   
	   signal: accelerometer signals as described in the original
	   data set.
	   	  tBodyAcc
	   	  tGravityAcc
	   	  tBodyAccJerk
	   	  tBodyGyro
	   	  tBodyGyroJerk
	      tBodyAccMag
	      tGravityAccMag
	      tBodyAccJerkMag
	      tBodyGyroMag
	      tBodyGyroJerkMag
	      fBodyAcc
	      fBodyAccJerk
	      fBodyGyro
	      fBodyAccMag
	      fBodyAccJerkMag
	      fBodyGyroMag
		  fBodyGyroJerkMag
		
		-calc(): calculation method
		  mean(): average
		  std():  standard deviation
		  
		-XYZ: optional, indicated coordinates X, Y or Z.
		
	   These variables are numeric (double) and averaged by subject
	   and by activity from the original data set.
	   




	   			


