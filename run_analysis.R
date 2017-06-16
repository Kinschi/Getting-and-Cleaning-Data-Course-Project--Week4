
## Downloading / unzipping the data

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, "UCI_HAR_Dataset.zip")
unzip("UCI_HAR_Dataset.zip")

## 1. Merges the training and the test sets to create one data set.
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
x <- rbind(x_train, x_test)

y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
y <- rbind(y_train, y_test)

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject <- rbind(subject_train, subject_test)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("UCI HAR Dataset/features.txt")
mean_std <- grep("-(mean|std)\\(\\)", features[, 2])
x <- x[, mean_std]
names(x) <- features[mean_std, 2]

## 3. Uses descriptive activity names to name the activities in the data set.
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
y[, 1] <- activities[y[, 1], 2]
names(y) <- "activity"

## 4. Appropriately labels the data set with descriptive variable names.
names(subject) <- "subject"
data <- cbind(x, y, subject)

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of
##    each variable for each activity and each subject.
library(plyr)
averages <- ddply(data, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averages, "averages.txt", row.name=FALSE)



