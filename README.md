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



