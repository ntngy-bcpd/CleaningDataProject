Getting and Cleaning Data
Project

The submitted files are:

	1. tidyData.txt - the tidy data set as described in the code book.
	2. run_analysis.R - the script for performing the steps to create
	   the tidyData.txt.
	3. CodeBook.md - the code book describing the variables, the data
	   and transfomations done to clean and tidy up the data.
	4. README.md - this file describing how to run the script file 
	   run_analysis.R.
	   
Assumptions:

	1. run_analysis.R is in the working directory.
	2. The UCI HAR data set is in the folder named "UCI HAR Dataset"
	   in the working directory.
	3. Packages plyr and stringr are installed and available 
	   in the R environment.
	   
How to run the script:

	1. Open the script run_analysis.R in R Studio.
	2. Set the working directory to the one that 
	   run_analysis.R is in.
	3. Run the source. The analysis is done as follows:
	
		a. Reads data tables.
		b. Merges the training and the test sets to create one data set.
		c. Extracts only the measurements on the mean and standard deviation for each measurement.
		d. Uses descriptive activity names to name the activities in the data set.
		e. Labels the data set with descriptive variable names, using features.
		f. Create a tidy data set with the average of each variable for each activity and each subject.
		
	4. Once the run is done, the tidyData.txt file is created 
	   in the working directory.
	   


	   