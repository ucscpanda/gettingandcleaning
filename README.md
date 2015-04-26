# gettingandcleaning
Programming assignment for the Coursera Getting and Cleaning Data course.
## run_analysis.R
The run_analysis.R script creates 2 tidy data tables from raw activity data via a series of 8 steps outlined below.  
1.  Loads the data from the working directory (see note below).  
2.  Combines the subject and activity data with the features measurement data for each the training and test sets.  
3.  Merges the training data and the test data sets to create a single data set.  
4.  Extracts only the measurements with a column name containing "mean()" or "std()", i.e. only the measurement means and standard deviations.  
5.  Applies the activity names, found in activity_labels.txt, to the data set.  
6.  Appropriately labels the variables with the features names found in features.txt.  
7.  The data created is called "act.data".  
8.  From the act.data, a second data set is created, with the average of each variable for each activity and each subject. This data is called act.means and retains the data structure from act.data.   
## Raw Data
The raw data can be downloaded here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
Please extract the data into your working directory. run_analysis.R assumes that the data will be in the working directory in the folder labelled "UCI HAR Dataset"
## Output
run_analysis.R outputs two seperate data tables, act.data and act.mean.  
1. act.data is a list of means and standard deviations for 30 subjects recorded while they were doing various activies.  
2. act.mean is the means for each measurement recorded in act.data for each subject/activity combination.
