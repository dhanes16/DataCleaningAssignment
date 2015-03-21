# run_analysis.R
# Assignment for Getting and Cleaning Data

# Orignal data source and reference materials
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Download file from stated source - Uncomment to refetch
# fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(fileURL, destfile="./data/FUCI Har Dataset.zip", mode="wb")

#dataFolder -"./data/UCI Har Dataset/"


library(plyr)

# Read features, or column names, for measurements in X_test.txt and X_train.txt
features <- read.table("./data/UCI HAR Dataset/features.txt")

# Read measurements and apply features
XTest <- read.table("./data/UCI HAR Dataset/test/X_test.txt", col.names = features$V2, colClasses = "numeric", check.names=FALSE)
XTrain <- read.table("./data/UCI HAR Dataset/train/X_train.txt", col.names = features$V2, colClasses = "numeric", check.names=FALSE)

# Read activities and activity labels and add to XTest and XTrain datasets
testActivities <- read.table("./data/UCI HAR Dataset/test/y_test.txt", colClasses = "integer")
trainActivities <- read.table("./data/UCI HAR Dataset/train/y_train.txt", colClasses = "integer")
activityLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
XTest$Activity <- factor(testActivities$V1, levels=activityLabels$V1, labels=activityLabels$V2)
XTrain$Activity <- factor(trainActivities$V1, levels=activityLabels$V1, labels=activityLabels$V2)

# Read subjects and add to XTest and XTrain datasets
testSubjects <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", colClasses = "integer")
trainSubjects <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", colClasses = "integer")
XTest$Subject <- testSubjects$V1
XTrain$Subject <- trainSubjects$V1

# Union XTest and XTrain datasets
XUnioned <- rbind(XTrain, XTest)

# Only need columns with "std()" or "mean()" in the names, as well as Activity and Subject
columnFilter <- grep("std\\()|mean\\()|^Activity$|^Subject$", names(XUnioned))
X <- XUnioned[, columnFilter]

# Create tidy data set with data grouped by Subject and Activity and numerics averaged and write file
XTidySet <- ddply(X, c("Subject", "Activity"), numcolwise(mean))
write.table(XTidySet, "./data/UCI HAR Dataset/tidy.txt", row.names=FALSE)
