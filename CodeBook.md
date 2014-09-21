## 1. Merges the training and the test sets to create one data set.
x_train, “y_train, subject_train, x_test, y_test, subject_test are dataframe variables used for extracting and storing data from respective six txt.files 
X is the resulting matrix merging “test” and “train” files information from the above six datafames.  
X is created,as follows:
1) binding dataframes with measurements (x_test, x_train)
2) binding with t(features) for the column names
3) binding with subjects
4) binding with activities
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
From the resulting matrix X containing information on 561 measurements I extract only those with mean() and sd() measurements
“selection” is the variable which selects columns containing mean() and std(), excluding meanFreq()
X_selected is the resulting matrix with only “means” and “std” measurement columns, subject and activities
## 3. Uses descriptive activity names to name the activities in the data set
activities is the character vector which contains the names of activities extracted from "activity_labels.txt"
## 4. Appropriately labels the data set with descriptive activity names.
The numbers in the “activities” column of X_selected are substituted with labels based on “activities” vector created in step 3
## 5. Appropriately labels the data set with descriptive activity names.
I use melt and dcast functions of reshape2 librqry to structure X_selected. The new dataframe “X_mean” contains mean values, has  69 columns (66 measurements plus subject, activity_id and activity columns) 180 rows (30 subjects by 6 activities)
