# DataCleaningAssign
Coursera Data Cleaning Assignment

The following process describes how the data received from  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  is transformed into the data sets,  "Tidy_data.txt" and "Average_data.txt",  for further analysis.

1. The zipfile is downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzipped into a directory named "UCI HAR Dataset". 
2. The ass.R file is run with the home directory (variable home_dir) set to the location of the "UCI HAR Dataset" directory.
3. This R script will merge the training and tests data sets (found in "X_train.txt" and "X_test.txt").
4. It extracts only the means and standard deviation variables from these data sets, getting the variable names for these data sets from "features.txt".
5. A string column is added to describe the activity performed during the measurements being taken. This is taken from "activity_info.txt".
6. Descriptive labels are given to the column headers. These are given the info found in "features_info.txt"
7. The "Tidy_data.txt" data set is produced given the above, inside the "UCI HAR Dataset" directory.
8. A further data set "Average_data.txt" data set is written out, inside the "UCI HAR Dataset" directory, giving the means of each subject and activity for each column in the "Tidy_data.txt" data set.
