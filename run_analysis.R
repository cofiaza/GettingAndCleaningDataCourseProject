##
## Script to transform raw data into a tidy data set
##
## Step 0. Bring up R and make sure to change the directory to "UCI HAR Dataset"
##
## Step 1. Merge the training and the test sets to create one data set.
##
## .......step1a: Merge the signals, training and the test sets to create one data set.

rawtest <- read.table("./test/X_test.txt")  
rawtrain <- read.table("./train/X_train.txt")  
rawsignals <- rbind(rawtest,rawtrain)

## .......step1b: Merge the activity, training and the test sets to create one data set.

rawtestactivity <- read.table("./test/y_test.txt")
rawtrainactivity <- read.table("./train/y_train.txt")
rawactivity <- rbind(rawtestactivity,rawtrainactivity)

## .......step1c: Merge the subjects, training and the test sets to create one data set.

rawtestsubject <- read.table("./test/subject_test.txt")
rawtrainsubject <- read.table("./train/subject_train.txt")
rawsubject <- rbind(rawtestsubject,rawtrainsubject)

## .......step1d: Load column names / variable names to a data frame

rawfeatures <- read.table("features.txt")

## .......step1e: Change the column names of the data frame with the combined signals using the features.txt file 

colnames(rawsignals) <- rawfeatures$V2

##
## Step 2. Extract only the measurements on the mean and standard deviation for each measurement. 
##
##   create a new data frame that has a subset of only mean and std columns from the signals 

signalsmeanstd <- rawsignals[,grep("[Mm][Ee][Aa][Nn]|[Ss][Tt][Dd]", names(rawsignals), value = TRUE)]


##
## Step 3. Use descriptive activity names to name the activities in the data set
##

## .......step3a: Load activity code/description reference file to a data frame

rawlabels <- read.table("activity_labels.txt")

## .......step3b: Overwrite the activity data frame with a joined activity-data and reference-data frames to get the activity descriptions 
library(dplyr)
rawactivity <- merge(rawactivity,rawlabels,by.x="V1",by.y="V1",na.rm=TRUE)


##
## Step 4.Appropriately label the data set with descriptive variable names. 
##
##  done in step1e with colnames

##
## Step 5.From the data set in step 4, create a second, independent tidy data set 
##        with the average of each variable for each activity and each subject.
			
## .......step5a: Column bind the subject-data with activity-data and make the column names descriptive
tidyset <- cbind(rawsubject,rawactivity$V2)			
colnames(tidyset) <- c("Subject","Activity")

## .......step5b: Column bind the above with the signals data frame (that has only means and std) 
tidyset <- cbind(tidyset,signalsmeanstd)

## .......step5c: get the average or mean of each variable/column group by subject and activity
MeanSignalPerSubjectActivity <- aggregate(tidyset[, 3:88], list(Subject=tidyset$Subject,Activity=tidyset$Activity),mean) %>% arrange(Subject,Activity)

## .......step5d: write the results to a text file as the new tidy data set
write.table(MeanSignalPerSubjectActivity, "MeanSignalPerSubjectActivity.txt")

