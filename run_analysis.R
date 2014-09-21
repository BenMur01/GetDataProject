## Getting and Cleaning Data Course Project
## Create one R script called run_analysis.R to do the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each
##    activity and each subject.

## Open "data.table" & "reshape2" libraries
library("data.table")
library("reshape2")

## Load test & train data.
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

## Load activity labels & data column names and assign names
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

names(X_test) = features
names(X_train) = features

y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"

y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"

## Get Relevant mean and standard deviation measurements from data.
extract_features = grepl("mean|std", features)
X_test = X_test[,extract_features]
X_train = X_train[,extract_features]

## Bind this data
test_data <- cbind(as.data.table(subject_test), y_test, X_test)
train_data <- cbind(as.data.table(subject_train), y_train, X_train)

## Merge both sets of data
data = rbind(test_data, train_data)

id_labels   = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data      = melt(data, id = id_labels, measure.vars = data_labels)

## Using the dcast function apply mean function
tidy_data   = dcast(melt_data, subject + Activity_Label ~ variable, mean)

## Write the text file
write.table(tidy_data, file = "./tidy_data.txt",row.names=FALSE)