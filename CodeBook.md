#1. Variables

###Subjects
- The number of each participants in the measurement
integer 1:30

###Activities

6 types of activities during which the measurements were made
- 1 WALKING 
- 2 WALKING_UPSTAIRS  
- 3 WALKING_DOWNSTAIRS 
- 4 SITTING
- 5 STANDING 
- 6 LAYING

###Measurements

Mean value and Standard deviation of signal measurements collected from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
-	tBodyAcc-XYZ: body acceleration 
-	tGravityAcc-XYZ: gravity acceleration 
-	tBodyAccJerk-XYZ: body acceleration Jerk signal
-	tBodyGyro-XYZ: body angular velocity
-	tBodyGyroJerk-XYZ: body angular velocity Jerk signal
-	tBodyAccMag: magnitude of body acceleration calculated using the Euclidean norm
-	tGravityAccMag: magnitude of gravity acceleration calculated using the Euclidean norm
-	tBodyAccJerkMag: magnitude of body acceleration Jerk signal calculated using the Euclidean norm
-	tBodyGyroMag: magnitude of gravity acceleration calculated using the Euclidean norm
-	tBodyGyroJerkMag: magnitude of gravity acceleration Jerk signal calculated using the Euclidean norm
-	fBodyAcc-XYZ: Fast Fourier Transform applied to body acceleration signal
-	fBodyAccJerk-XYZ: Fast Fourier Transform applied to body acceleration Jerk signal
-	fBodyGyro-XYZ: Fast Fourier Transform applied to gravity acceleration signal
-	fBodyAccMag: Fast Fourier Transform applied to body acceleration magnitude
-	fBodyAccJerkMag: Fast Fourier Transform applied to body acceleration Jerk signal magnitude
-	fBodyGyroMag: Fast Fourier Transform applied to gravity acceleration signal
-	fBodyGyroJerkMag: Fast Fourier Transform applied to gravity acceleration Jerk signal


#2. Performed Operations

### 1. Merges the training and the test sets to create one data set.
x_train, “y_train, subject_train, x_test, y_test, subject_test are dataframe variables used for extracting and storing data from respective six txt.files 
X is the resulting matrix merging “test” and “train” files information from the above six datafames.  
X is created,as follows:
* **binding measurements (x_test, x_train)**
* **binding with features for the column names**
* **binding with subjects**
* **binding with activities**

### 2. Extracts only the measurements on the mean and standard deviation for each measurement.
From the resulting matrix X containing information on 561 measurements I extract only those with mean() and sd() measurements
“selection” is the variable which selects columns containing mean() and std(), excluding meanFreq()
X_selected is the resulting matrix with only “means” and “std” measurement columns, subject and activities

### 3. Uses descriptive activity names to name the activities in the data set
activities is the character vector which contains the names of activities extracted from "activity_labels.txt"

### 4. Appropriately labels the data set with descriptive activity names.
I use aggregate function to structure X_selected. The new dataframe “X_mean” contains mean values, has  69 columns (66 measurements plus subject, activity_id and activity columns) 180 rows (30 subjects by 6 activities)


#2. Data Sources


![merging](https://coursera-forum-screenshots.s3.amazonaws.com/ab/a2776024af11e4a69d5576f8bc8459/Slide2.png)

