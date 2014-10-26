# Cook Book
===========

## Data
According to the project instruction (), raw data was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip on **26 Oct. 2014**. Then, the zip file was unpacked into folder *UCI HAR Dataset*. The data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Script

R script called run_analysis.R that does the following. 
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Variables
* tFeatures					the complete list of variables of each feature data set
* tX_train					training measurement data set
* tX_test						test measurement data set
* tMerged						merged measurement data set of traing data set and test data set

* meanAndStandardFeatures		mean and starndard features
* tMeanAndStandard			the measurements on the mean and standard deviation

* tY_test						test activities
* tY_train					train activities
* tYMerged					merged test activities and train activities
* tActivityLabels				activity lables

* tXMergedWithLabels			merged measurement data set with with descriptive activity names
* tMeanAndStandardWithLables	measurement mean and standard deviation with descriptive activity names

* tSubject_train				training subject data set
* tSubject_test				test subject data set
* tSubjectMerged				merged subject data set of traing data set and test data set
* tAverages					the average for each activity and each subject


## Result
According to the project request, a txt file named *result.txt* has been output in the final step containing the data set by calling write.table() using row.name=FALSE.
