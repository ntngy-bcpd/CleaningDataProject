# Getting and Cleaning Data
# Project - Tidying the UCI HAR Dataset

# Run the run_analysis.R in a working directory containing 
# the data folder: .\UCI HAR Dataset

# Assume plyr and stringr installed in the current R environment

library(plyr)
library(stringr)

# Define file names

fileActivityLabels <- ".\\UCI HAR Dataset\\activity_labels.txt"
fileFeatures <- ".\\UCI HAR Dataset\\features.txt"
fileSubjectTest <- ".\\UCI HAR Dataset\\test\\subject_test.txt"
fileXTest <- ".\\UCI HAR Dataset\\test\\X_test.txt"
fileYTest <- ".\\UCI HAR Dataset\\test\\y_test.txt"
fileSubjectTrain <- ".\\UCI HAR Dataset\\train\\subject_train.txt"
fileXTrain <- ".\\UCI HAR Dataset\\train\\X_train.txt"
fileYTrain <- ".\\UCI HAR Dataset\\train\\y_train.txt"
fileTidyData <- ".\\tidyData.txt"

# Read data files to tables

print("Reading data tables...")
activityLabels <- read.table(fileActivityLabels, header=FALSE, stringsAsFactors=TRUE)
features <- read.table(fileFeatures, header=FALSE, stringsAsFactors=FALSE)
subjectTest <- read.table(fileSubjectTest, header=FALSE)
xTest <- read.table(fileXTest, header=FALSE)
yTest <- read.table(fileYTest, header=FALSE)
subjectTrain <- read.table(fileSubjectTrain, header=FALSE)
xTrain <- read.table(fileXTrain, header=FALSE)
yTrain <- read.table(fileYTrain, header=FALSE)

# Bind the test and train datasets by columns

print("Merges the training and the test sets to create one data set.")
test <- cbind(subjectTest, xTest, yTest)
train <- cbind(subjectTrain, xTrain, yTrain)
testTrain <- rbind(test, train)

# Select the columns with mean() and std() in their names
# and add the first (subject) and the last column (activity)

print("Extracts only the measurements on the mean and standard deviation for each measurement.")
selectedColIds <- (str_detect(features$V2, fixed("mean()"))
                  | str_detect(features$V2, fixed("std()")))
selectedColIds <- c(TRUE, selectedColIds, TRUE)
selectedData <- testTrain[, selectedColIds]

# Replace activity integers with activity labels

print("Uses descriptive activity names to name the activities in the data set.")
activityCol <- ncol(selectedData)
selectedData[, activityCol] <- activityLabels[selectedData[, activityCol], 2]

# Replace variable names with features

print("Labels the data set with descriptive variable names, using features.")
intNames <- gsub("V", "", names(selectedData))
intNames <- as.integer(intNames)
names(selectedData)[1] <- "Subject"
names(selectedData)[activityCol] <- "Activity"
names(selectedData)[2:(activityCol-1)] <- features$V2[intNames[2:(activityCol-1)]]

# Tidy the data by grouping by subject and activity

print("Create a tidy data set with the average of each variable for each activity and each subject.")
tidyData <- ddply(selectedData, .(Subject, Activity), numcolwise(mean))
write.table(tidyData, file=fileTidyData, row.name=FALSE)

print("Done.")

