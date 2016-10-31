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

##
## Step 4.Appropriately label the data set with descriptive variable names. 
##
##  done in step1e with colnames

##
## Step 5.From the data set in step 4, create a second, independent tidy data set 
##        with the average of each variable for each activity and each subject.
			
## .......step5a: Column bind the subject-data with activity-data and make the column names descriptive
tidyset <- cbind(rawsubject,rawactivity)	
colnames(tidyset)[1] <- "Subject"

## .......step5b: Column bind the above with the signals data frame (that has only means and std) 
tidyset <- cbind(tidyset,signalsmeanstd)

## .......step5c: get the average or mean of each variable/column group by subject and activity
tidyall <- aggregate( tidyset[, 3:88], tidyset[,1:2], FUN = mean )
tidyall2 <- merge(tidyall, rawlabels, all=TRUE)
tidyall3 <- tidyall2[,c(2,1,89,3:88)]

colnames(tidyall3)[3] <- "Activity"
tidyall4 <- tidyall3[,c(1,3:89)]

MeanSignalPerSubjectActivity <- tidyall3[,c(1,3:89)]

## .......step5d: write the results to a text file as the new tidy data set
write.table(MeanSignalPerSubjectActivity, "MeanSignalPerSubjectActivity.txt",row.name=FALSE )

