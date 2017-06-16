# Files in the Getting and Cleaning Data - Course Project (Week 4)

- CodeBook.md describes the data (identitfiers, activity labels, signals and variables) analyzed.
- run_analysis.R contains the code to create the tidy data. The R script does the following (5 steps):

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

- averages.txt is the final result of the run_analysis.R - Code.

