
Codebook
The purpose of this file set is to transform the given raw data to a tidy set.
Transformation steps, variables, and data set information is as follows


I. Raw Data
-----------
1. Raw data came from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

2. Please refer to this url for a description of the raw data
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


II. Transformation Steps
---------------------------

1. Download the zip file from the url
2. Unzip to a local machine
3. Bring up R and set the working directory to the path where the files were unzipped.
4. Run the R script run_analysis.R
5. The output will be a text file with the tidy data set as described below.


III. R script description
-------------------------

1. Merge the training and the test sets to create one data set.

1a: Merge the signals, training and the test sets to create one data set.

1b: Merge the activity, training and the test sets to create one data set.

1c: Merge the subjects, training and the test sets to create one data set.

1d: Load column names / variable names to a data frame

1e: Change the column names of the data frame with the combined signals using the features.txt file 

2. Extract only the measurements on the mean and standard deviation for each measurement. 

Create a new data frame that has a subset of only mean and std columns from the signals 

3. Use descriptive activity names to name the activities in the data set

3a: Load activity code/description reference file to a data frame

3b: Overwrite the activity data frame with a joined activity-data and reference-data frames to get the activity descriptions 

4. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

4a: Column bind the subject-data with activity-data and make the column names descriptive

4b: Column bind the above with the signals data frame (that has only means and std) 

4c: get the average or mean of each variable/column group by subject and activity

4d: write the results to a text file as the new tidy data set


IV. Tidy Data set
------------------

1. First step was to combine the training and test raw data files, including the subject, activity, and signals.
2. The data frame includes only the mean and standard deviation columns from the original set.
3. The final data frame consists of the average of all columns grouped by Subject and Activity.
4. Finally, the data was written to a text file called MeanSignalPerSubjectActivity.txt


V. Variables
------------

1. The variables are all signals coming from wearable devices.  
2. These signals are, in particular, the accelerometer and gyroscope 3-axial raw signals brought about by specific activities from different wearers/subjects. 
3. More information about how these signals were gathered in the features_info.txt file included in the downloadable raw data zip file.


The original, UNtransformed data is described in the following
==============================================================
Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'
