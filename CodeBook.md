
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



