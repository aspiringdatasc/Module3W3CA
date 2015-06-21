# Getting and Cleaning Data Course Project

## This is part of module 3 of John Hopkins data science coursera

## Getting started
1. 	All instructions are in single file "run_analysis.R"
2. 	These needs the raw Samsung data to be downloaded and extracted into the same directory where run_analysis.R is your working directory
3. 	The raw files can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
4. 	Ensure the extracted file is put into path "./UCI HAR Dataset/". Actual path can be modified by changing the variable dirpath in "run_analysis.R"
5. 	This script produces an output of tidy data of averages of 79 features of smartphone mean/standard deviation measurements.
	Please see codebook.MD for further information on tidy data set.
6. 	The output file is named "tidydata.txt"
7. 	To read the tidydata, please use following R script:
checktidydata <- read.table("tidydata.txt", header = TRUE)

## About run_analysis.R, the script performs the following in these order:
1.	Substitute descriptive activity names to name the activities in the data set (Y_test.txt, Y_train.txt of raw files)
2.	Appropriately labels the data set with descriptive variable names using labels from features.txt of raw files
3. 	As there are two data sets train and test, the process is to ensure both data sets are labelled correctly and merged from
	various files
4.	Merges the training and the test sets to create one data set.
5.	Extracts only the measurements on the mean and standard deviation for each measurement. 
6.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Further readings:
[1] Actual course assignment
	https://class.coursera.org/getdata-015/human_grading/view/courses/973502/assessments/3/submissions
[2] Human activity recoginition using smartphone (site where data was obtained)
	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

