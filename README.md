# DataCleaningAssignment
Assignment for Getting and Cleaning Data course 

## Assignment Instructions
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Usage
1. Download the zip file
2. Extract the zip file into ./data
3. Run the run_analysis.R script from the R home directory
4. The output of the script will be wirtten to: ./data/UCI HAR Dataset/tidy.txt

##Script explanation
The run_analysis.R script:
- Loads the X_test.txt and X_train.txt files
- Adds column headings from features.txt to the X data sets
- Adds the Activity colums from a mapping of the integer values in y_test.txt and y_train.txt contained in activity_labels.txt
- Adds the Subject columns from the subject_test.txt and subject_train.txt files respectfully
- Combines the test and train datasets into a single dataset
- Removes all columns except those with mean() and std() in the column headings (keeping the Subject and Activity columns as well)
- Averages each column, grouped by Subject and Activity giving the average value for each column for each subject and activity
- Writes out the result in the file tidy.txt
