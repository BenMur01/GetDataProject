## Getting and Cleaning Data Project

Brendan Murphy

### Description
This is a course project for Johns Hopkins Getting and Cleaning Data course.

### Source Data
The source data for the project can be found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Attribute Information
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### The following are the steps taken in the run_analysis program

## Open the following Libraries
library("data.table")
library("reshape2")

## Read in the following files
- x_test.txt
- y_test.txt
- subject_test.txt
- x_train.txt
- y_train.txt
- subject_train.txt
- activity_labels.txt
- features.txt

Assign column names and merge to create one data set.

## Extract only the measurements on the mean and standard deviation for each measurement. 
Using grepl extract the relevant mean and Standard Deviation columns

## Bind x and y test data
Using cbind bind "x test" and "y test""

## Merge both sets of data
Using rbind take both sets of data from above and create a new data frame called "data"

## Merge both sets of data
Using rbind take both sets of data from above and create a new data frame called "data"

## Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
Using the melt and dcast and then the mean function we get the average of each variable for each activity and each subject.

## Write to a text file
Using write.table function we write the data to tidy_data.txt