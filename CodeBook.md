Assuming that this R script resides in the directory where there is a subdirectory "./UCI HAR Dataset"
which contains all the required data.  First read the test data set and merge the various files.
Then, perform the same read of the train data set and merge the various files.  The last step is to
merge the test and train data sets.

Using library(plyr) to join data instead of merge to preserve ordering of rows.

Read the activity_labels.txt metadata file.  This file has the six unique activity IDs and labels.
* activityLabels - stores the list of activity labels by activityID

Read the features.txt metadata file.  This file has the 561 unique feature IDs and labels.
* featureLabels - stores the list of activity labels by FeatureID

----------------------------------------------------------------------------------------
Start reading in the test an train data sets.  Need to join the data sets with the metadata
files read from the base directory above.
Also need to process and compute the mean and std. dev. of the data. 
----------------------------------------------------------------------------------------


Read the test data set.  It has 561 delimited columns for each of the measured features.
Use the feature names from above metadata to relabel the columns accordingly.

* testData - stores the raw data set for test subjects

----------------------------------------------------------------------------------------
The use of Inertial Signals is optional.  Getting the mean and std. dev. for each measurement.
----------------------------------------------------------------------------------------

* testBodyAccXData - stores the raw data set for X-axis body acceleration
* testBodyAccXMean - stores the mean of X-axis body acceleration
* testBodyAccXSTD - stores the std. dev. of X-axis body acceleration
(Repeat process for Y and Z axis)

* testGyroXData - stores the raw data set for X-axis angular velocity
* testGyroXMean - stores the mean of X-axis angular velocity
* testGyroXSTD - stores the std. dev. of X-axis angular velocity
(Repeat process for Y and Z axis)

* testTotalAccXData - stores the raw data set for X-axis total acceleration
* testTotalAccXMean - stores the mean of X-axis total acceleration
* testTotalAccXSTD - stores the std. dev. of X-axis total acceleration
(Repeat process for Y and Z axis)

----------------------------------------------------------------------------------------
End of optional data collection
----------------------------------------------------------------------------------------

Read the test activity IDs.  Each row identifies the Activity ID for each vector from the
previous feature measurement file.
Use the activity names from above metadata to merge by ActivityID for determine row activity names accordingly.

* testLabelData - stores the joined data of each measurement with activity labels for each subject

Read the test subjects.  Each row is identified by a subject ID

* testSubjectData - stores the joined data of each measurement with each subject

Join all the three test data sets together - SubjectID, ActivityID/Name, Features Vector
* testSubjectBodyAccData - stores the mean and std. deviation of all the body acceleration
* testSubjectGyroData - stores the mean and std. deviation of all the angular velocity
* testSubjectTotalAccData - stores the mean and std. deviation of all the total acceleration
* testSubjectActivityData - stores all the measurements for the test subjects


----------------------------------------------------------------------------------------
Repeat the same read data process for the train subjects
----------------------------------------------------------------------------------------

Read the train data set.  It has 561 delimited columns for each of the measured features.
Use the feature names from above metadata to relabel the columns accordingly.

* trainData - stores the raw data set for train subjects

----------------------------------------------------------------------------------------
The use of Inertial Signals is optional.  Getting the mean and std. dev. for each measurement.
----------------------------------------------------------------------------------------

* trainBodyAccXData - stores the raw data set for X-axis body acceleration
* trainBodyAccXMean - stores the mean of X-axis body acceleration
* trainBodyAccXSTD - stores the std. dev. of X-axis body acceleration
(Repeat process for Y and Z axis)

* trainGyroXData - stores the raw data set for X-axis angular velocity
* trainGyroXMean - stores the mean of X-axis angular velocity
* trainGyroXSTD - stores the std. dev. of X-axis angular velocity
(Repeat process for Y and Z axis)

* trainTotalAccXData - stores the raw data set for X-axis total acceleration
* trainTotalAccXMean - stores the mean of X-axis total acceleration
* trainTotalAccXSTD - stores the std. dev. of X-axis total acceleration
(Repeat process for Y and Z axis)

----------------------------------------------------------------------------------------
End of optional data collection
----------------------------------------------------------------------------------------

Read the train activity IDs.  Each row identifies the Activity ID for each vector from the
previous feature measurement file.
Use the activity names from above metadata to merge by ActivityID for determine row activity names accordingly.

* trainLabelData - stores the joined data of each measurement with activity labels for each subject

Read the train subjects.  Each row is identified by a subject ID

* trainSubjectData - stores the joined data of each measurement with each subject

Join all the three train data sets together - SubjectID, ActivityID/Name, Features Vector
* trainSubjectBodyAccData - stores the mean and std. deviation of all the body acceleration
* trainSubjectGyroData - stores the mean and std. deviation of all the angular velocity
* trainSubjectTotalAccData - stores the mean and std. deviation of all the total acceleration
* trainSubjectActivityData - stores all the measurements for the train subjects


----------------------------------------------------------------------------------------
Join test and train data sets
----------------------------------------------------------------------------------------
* allSubjectActivityData - stores all the test and train data combined
* summary_allSubjectActivityData - summary of all the test and train data combined 

Check if there are any NA in the data

Creates the tidy data set summarizing the data by getting the mean of each measurement,
sorted by subject and activity
* groups - list of groups - SubjectID, ActivityID, ActivitLabel
* meanSummary_allSubjectActivityData - aggregate of all data by the groups
* sorted_meanSummary_allSubjectActivityData - all the data sorted by the groups

Write the results to a file
