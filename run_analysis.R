## This R-script does the following:
## To create a tidy data set from raw data found in:
## Please also read the README.md to have a description of the process of
## creating the tidy data
rm(list=ls())

library(plyr)
dirpath <- "./UCI HAR Dataset/"

## Reading the raw label files
activity_labels <- as.character(
        read.table(paste(dirpath, "activity_labels.txt", sep =""))[,2])
features <- as.character(
        read.table(paste(dirpath, "features.txt", sep =""))[,2])                                                                       

## Defining the file locations for reading the raw datasets of train and test
traindatafile1 <- paste(dirpath, "train/X_train.txt", sep ="")
traindatafile2 <- paste(dirpath, "train/Y_train.txt", sep ="")
traindatafile3 <- paste(dirpath, "train/subject_train.txt", sep ="")
testdatafile1 <- paste(dirpath, "test/X_test.txt", sep ="")
testdatafile2 <- paste(dirpath, "test/Y_test.txt", sep ="")
testdatafile3 <- paste(dirpath, "test/subject_test.txt", sep ="")

## Reading the raw training and test dataset
traindataset1 <- read.table(traindatafile1)
traindataset2 <- read.table(traindatafile2)
traindataset3 <- read.table(traindatafile3)
testdataset1 <- read.table(testdatafile1)
testdataset2 <- read.table(testdatafile2)
testdataset3 <- read.table(testdatafile3)

## Name the column activity which converts integers in Y_train to activity
## labels (string) for each observation
traindataset4 <- data.frame(activity = activity_labels[traindataset2[,1]])
testdataset4 <- data.frame(activity = activity_labels[testdataset2[,1]])

## Name the columns of X_train by features labels previously loaded from file
colnames(traindataset1) <- features
colnames(traindataset3) <- "subject"
colnames(testdataset1) <- features
colnames(testdataset3) <- "subject"

## Add new column for source type of data set which is under Training
## or Test data set respectively
## traindataset3$source <- "Training"
## testdataset3$source <- "Test"

## Combine all variables activities, subject, source, features columns together
## for each training and test data set
traindataset <- cbind(traindataset3, traindataset4, traindataset1)
testdataset <- cbind(testdataset3, testdataset4, testdataset1)

## Merge both training and test sets into one data set 
combineddataset <- rbind(traindataset, testdataset)

## Extracting only columns with activity, mean and standard deviation
columnfilterstring <- "subject|activity|source|mean|std"
extractdata <- combineddataset[grepl(columnfilterstring, names(traindataset))]

## Produce tidy data of average of all variables for each activity and each
## subject
tidydata <- ddply(extractdata, .(subject,activity), colwise(mean))

# Output tidy data to tidydata.txt
write.table(tidydata, file="tidydata.txt", row.name=FALSE)

## Test reding back data from output file
checktidydata <- read.table("tidydata.txt", header = TRUE) 
