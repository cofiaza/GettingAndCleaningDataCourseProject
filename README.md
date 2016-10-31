=======================================================================================
Deriving the Average Acceleration and Angular Velocity Signals from Wearables Activity

A Project Assignment
for Getting and Cleaning Data Course 
Coursera.com

More detailed information on the original data at: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

=======================================================================================
The original data set was obtained by the following methods:
============================================================
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 
From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 



This dataset includes the following files:
=========================================
- 'README.txt' - includes an explanation of the analysis files

- 'run_analysis.R' - an R script that transforms the original data into the averages 
                     of the mean and standard deviation of each column variable
                     
- 'MeanSignalPerSubjectActivity.txt' - a tidy data set that has the average 
                     of all Mean and Standard Deviation signals grouped by Subject and Activity
                     
- 'CodeBook.md' - a code book that describes the variables, the data, 
                  and the transformations performed to clean up the raw data


The original, UNtransformed data is described in the following==============================================================Feature Selection =================The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). These signals were used to estimate variables of the feature vector for each pattern:  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.tBodyAcc-XYZtGravityAcc-XYZtBodyAccJerk-XYZtBodyGyro-XYZtBodyGyroJerk-XYZtBodyAccMagtGravityAccMagtBodyAccJerkMagtBodyGyroMagtBodyGyroJerkMagfBodyAcc-XYZfBodyAccJerk-XYZfBodyGyro-XYZfBodyAccMagfBodyAccJerkMagfBodyGyroMagfBodyGyroJerkMagThe set of variables that were estimated from these signals are: mean(): Mean valuestd(): Standard deviationmad(): Median absolute deviation max(): Largest value in arraymin(): Smallest value in arraysma(): Signal magnitude areaenergy(): Energy measure. Sum of the squares divided by the number of values. iqr(): Interquartile range entropy(): Signal entropyarCoeff(): Autorregresion coefficients with Burg order equal to 4correlation(): correlation coefficient between two signalsmaxInds(): index of the frequency component with largest magnitudemeanFreq(): Weighted average of the frequency components to obtain a mean frequencyskewness(): skewness of the frequency domain signal kurtosis(): kurtosis of the frequency domain signal bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.angle(): Angle between to vectors.Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:gravityMeantBodyAccMeantBodyAccJerkMeantBodyGyroMeantBodyGyroJerkMeanThe complete list of variables of each feature vector is available in 'features.txt'
