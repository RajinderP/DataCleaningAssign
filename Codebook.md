<h1>CodeBook</h1>

This is a code book that describes the transformations performed on and new variables created from the dataset found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
For a description of the original dataset, please visit 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


<h2>1. Read Data</h2>

A list of the relevant .txt files found in the zip file is as follows:

•	X_test : values of variables in test

•	X_train : values of variables in train

•	y_test : activity ID in test

•	y_train : activity ID in train

•	subject_test : subject IDs for test

•	subject_train : subject IDs for train

•	activity_labels : Description of activity IDs in y_test and y_train

•	features : Label of each variables/column header in X_test and X_train

Since features give us the column headers for X_test and X_train, we use this to determine which columns have the mean and standard deviation variables (*allvar*) so that we only read these columns from X_test and X_train to reduce data reads.
The X_test, subject_test and y_test are bound together (in *test_df*) since subject_test contains the relevant information about the subject ID for each row in X_test and y_test contains the relevant information about the activity ID for each row in X_test. The same process is applied to the “train” files (in *train_df*).

<h2>2. Merge data</h2>

The test and train data is then merged along with the descriptive information from the activity_labels data files (Act_name) into a single data frame (*all_df*).

<h2>3. Give descriptive labels to variables</h2>

Using the extra information from the “features_info.txt” file, we can expand on some of the column headers so that the dataset becomes more readable. This is performed by substituting strings within the column headers (of *all_df*), for instance, replacing “Mag” by “Magnitude”.

<h2>4. Calculate statistics</h2>

We calculate the mean for each column, depending on the subject and activity (into *ave_df*).

<h2>5. Print out data</h2>

The tidied data is printed to “tidy_data.txt” ; the average data is printed to “average_data.txt”.

