# gettingandcleaning
Programming assignment for the Coursera Getting and Cleaning Data course.
## run_analysis.R
The run_analysis.R script creates 2 tidy data tables from raw activity data via a series of 5 steps outlined below.  
1.  Merges the training and the test sets to create one data set.  
2.  Extracts only the measurements on the mean and standard deviation for each measurement.   
3.  Uses descriptive activity names to name the activities in the data set.  
4.  Appropriately labels the data set with descriptive variable names.   
5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  
## Raw Data
The raw data can be downloaded here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
Please extract the data into your working directory. run_analysis.R assumes that the data will be in the working directory in the folder labelled "UCI HAR Dataset"
## Output
run_analysis.R outputs two seperate data tables, act.data and act.mean.  
1. act.data is a list of means and standard deviations for 30 subjects recorded while they were doing various activies.  
2. act.mean is the means for each measurement recorded in act.data for each subject/activity combination.
