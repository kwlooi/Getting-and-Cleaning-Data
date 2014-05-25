# Assuming that this R script resides in the directory where there is a subdirectory "./UCI HAR Dataset"
# which contains all the required data.  First read the test data set and merge the various files.
# Then, perform the same read of the train data set and merge the various files.  The last step is to
# merge the test and train data sets.
#
# Using library(plyr) to join data instead of merge to preserve ordering of rows.

library(plyr)

# Read the activity_labels.txt metadata file.  This file has the six unique activity IDs and labels.
con <- file("./UCI HAR Dataset/activity_labels.txt","r")
activityLabels <- read.delim(file=con, header=FALSE, sep="")
close(con)
dim(activityLabels)
names(activityLabels) <- c("ActivityID", "ActivityLabel")
activityLabels

# Read the features.txt metadata file.  This file has the 561 unique feature IDs and labels.
con <- file("./UCI HAR Dataset/features.txt","r")
featureLabels <- read.delim(file=con, header=FALSE, sep="")
close(con)
dim(featureLabels)
names(featureLabels) <- c("FeatureID", "FeatureLabel")
head(featureLabels, 100)



# ----------------------------------------------------------------------------------------
# Start reading in the test an train data sets.  Need to join the data sets with the metadata
# files read from the base directory above.
# Also need to process and compute the mean and std. dev. of the data. 
# ----------------------------------------------------------------------------------------


# Read the test data set.  It has 561 delimited columns for each of the measured features.
# Use the feature names from above metadata to relabel the columns accordingly.
con <- file("./UCI HAR Dataset/test/X_test.txt","r")
testData <- read.delim(file=con, header=FALSE, sep="")
close(con)
dim(testData)
names(testData) <- featureLabels$FeatureLabel
head(testData)

# ----------------------------------------------------------------------------------------
# The use of Inertial Signals is optional.  Getting the mean and std. dev. for each measurement.
# ----------------------------------------------------------------------------------------
# Read the test subjects body_acc_x_test.txt data and compute the avarage and std. dev.
# for each row of 128 data values in the vector.
con <- file("./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt","r")
testBodyAccXData <- read.delim(file=con, header=FALSE, sep="")
close(con)
dim(testBodyAccXData)
# Get the mean and std. dev. for the first row to validate
mean(as.numeric (testBodyAccXData[1,]), na.rm=TRUE)
sd(as.numeric (testBodyAccXData[1,]), na.rm=TRUE)
head(rowMeans(testBodyAccXData))
head(apply(testBodyAccXData, 1, sd))
testBodyAccXMean <- rowMeans(testBodyAccXData)
testBodyAccXSTD <- apply(testBodyAccXData, 1, sd)

# Read the test subjects body_acc_y_test.txt data and compute the avarage and std. dev.
# for each row of 128 data values in the vector.
con <- file("./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt","r")
testBodyAccYData <- read.delim(file=con, header=FALSE, sep="")
close(con)
dim(testBodyAccYData)
# Get the mean and std. dev. for the first row to validate
mean(as.numeric (testBodyAccYData[1,]), na.rm=TRUE)
sd(as.numeric (testBodyAccYData[1,]), na.rm=TRUE)
head(rowMeans(testBodyAccYData))
head(apply(testBodyAccYData, 1, sd))
testBodyAccYMean <- rowMeans(testBodyAccYData)
testBodyAccYSTD <- apply(testBodyAccYData, 1, sd)

# Read the test subjects body_acc_z_test.txt data and compute the avarage and std. dev.
# for each row of 128 data values in the vector.
con <- file("./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt","r")
testBodyAccZData <- read.delim(file=con, header=FALSE, sep="")
close(con)
dim(testBodyAccZData)
# Get the mean and std. dev. for the first row to validate
mean(as.numeric (testBodyAccZData[1,]), na.rm=TRUE)
sd(as.numeric (testBodyAccZData[1,]), na.rm=TRUE)
head(rowMeans(testBodyAccZData))
head(apply(testBodyAccZData, 1, sd))
testBodyAccZMean <- rowMeans(testBodyAccZData)
testBodyAccZSTD <- apply(testBodyAccZData, 1, sd)
# ----------------------------------------------------------------------------------------
# Read the test subjects body_gyro_x_test.txt data and compute the avarage and std. dev.
# for each row of 128 data values in the vector.
con <- file("./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt","r")
testGyroXData <- read.delim(file=con, header=FALSE, sep="")
close(con)
dim(testGyroXData)
# Get the mean and std. dev. for the first row to validate
mean(as.numeric (testGyroXData[1,]), na.rm=TRUE)
sd(as.numeric (testGyroXData[1,]), na.rm=TRUE)
head(rowMeans(testGyroXData))
head(apply(testGyroXData, 1, sd))
testGyroXMean <- rowMeans(testGyroXData)
testGyroXSTD <- apply(testGyroXData, 1, sd)

# Read the test subjects body_gyro_y_test.txt data and compute the avarage and std. dev.
# for each row of 128 data values in the vector.
con <- file("./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt","r")
testGyroYData <- read.delim(file=con, header=FALSE, sep="")
close(con)
dim(testGyroYData)
# Get the mean and std. dev. for the first row to validate
mean(as.numeric (testGyroYData[1,]), na.rm=TRUE)
sd(as.numeric (testGyroYData[1,]), na.rm=TRUE)
head(rowMeans(testGyroYData))
head(apply(testGyroYData, 1, sd))
testGyroYMean <- rowMeans(testGyroYData)
testGyroYSTD <- apply(testGyroYData, 1, sd)

# Read the test subjects body_gyro_z_test.txt data and compute the avarage and std. dev.
# for each row of 128 data values in the vector.
con <- file("./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt","r")
testGyroZData <- read.delim(file=con, header=FALSE, sep="")
close(con)
dim(testGyroZData)
# Get the mean and std. dev. for the first row to validate
mean(as.numeric (testGyroZData[1,]), na.rm=TRUE)
sd(as.numeric (testGyroZData[1,]), na.rm=TRUE)
head(rowMeans(testGyroZData))
head(apply(testGyroZData, 1, sd))
testGyroZMean <- rowMeans(testGyroZData)
testGyroZSTD <- apply(testGyroZData, 1, sd)
# ----------------------------------------------------------------------------------------
# Read the test subjects total_acc_x_test.txt data and compute the avarage and std. dev.
# for each row of 128 data values in the vector.
con <- file("./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt","r")
testTotalAccXData <- read.delim(file=con, header=FALSE, sep="")
close(con)
dim(testTotalAccXData)
# Get the mean and std. dev. for the first row to validate
mean(as.numeric (testTotalAccXData[1,]), na.rm=TRUE)
sd(as.numeric (testTotalAccXData[1,]), na.rm=TRUE)
head(rowMeans(testTotalAccXData))
head(apply(testTotalAccXData, 1, sd))
testTotalAccXMean <- rowMeans(testTotalAccXData)
testTotalAccXSTD <- apply(testTotalAccXData, 1, sd)

# Read the test subjects total_acc_y_test.txt data and compute the avarage and std. dev.
# for each row of 128 data values in the vector.
con <- file("./UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt","r")
testTotalAccYData <- read.delim(file=con, header=FALSE, sep="")
close(con)
dim(testTotalAccYData)
# Get the mean and std. dev. for the first row to validate
mean(as.numeric (testTotalAccYData[1,]), na.rm=TRUE)
sd(as.numeric (testTotalAccYData[1,]), na.rm=TRUE)
head(rowMeans(testTotalAccYData))
head(apply(testTotalAccYData, 1, sd))
testTotalAccYMean <- rowMeans(testTotalAccYData)
testTotalAccYSTD <- apply(testTotalAccYData, 1, sd)

# Read the test subjects total_acc_z_test.txt data and compute the avarage and std. dev.
# for each row of 128 data values in the vector.
con <- file("./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt","r")
testTotalAccZData <- read.delim(file=con, header=FALSE, sep="")
close(con)
dim(testTotalAccZData)
# Get the mean and std. dev. for the first row to validate
mean(as.numeric (testTotalAccZData[1,]), na.rm=TRUE)
sd(as.numeric (testTotalAccZData[1,]), na.rm=TRUE)
head(rowMeans(testTotalAccZData))
head(apply(testTotalAccZData, 1, sd))
testTotalAccZMean <- rowMeans(testTotalAccZData)
testTotalAccZSTD <- apply(testTotalAccZData, 1, sd)
# ----------------------------------------------------------------------------------------
# End of optional data collection
# ----------------------------------------------------------------------------------------




# Read the test activity IDs.  Each row identifies the Activity ID for each vector from the
# previous feature measurement file.
# Use the activity names from above metadata to merge by ActivityID for determine row activity names accordingly.
con <- file("./UCI HAR Dataset/test/y_test.txt","r")
testLabelData <- read.delim(file=con, header=FALSE, sep="")
close(con)
dim(testLabelData)
names(testLabelData) <- "ActivityID"
#testLabelData <- merge(testLabelData, activityLabels, by.x="ActivityID", by.y="ActivityID", sort=FALSE)
testLabelData <- join(testLabelData, activityLabels)
head(testLabelData, 100)

# Read the test subjects.  Each row is identified by a subject ID
con <- file("./UCI HAR Dataset/test/subject_test.txt","r")
testSubjectData <- read.delim(file=con, header=FALSE, sep="")
close(con)
dim(testSubjectData)
names(testSubjectData) <- "SubjectID"
head(testSubjectData, 100)

# Join all the three test data sets together - SubjectID, ActivityID/Name, Features Vector
testSubjectBodyAccData <- cbind(testBodyAccXMean, testBodyAccXSTD, testBodyAccYMean, testBodyAccYSTD, testBodyAccZMean, testBodyAccZSTD)
testSubjectGyroData <- cbind(testGyroXMean, testGyroXSTD, testGyroYMean, testGyroYSTD, testGyroZMean, testGyroZSTD)
testSubjectTotalAccData <- cbind(testTotalAccXMean, testTotalAccXSTD, testTotalAccYMean, testTotalAccYSTD, testTotalAccZMean, testTotalAccZSTD)
dimnames(testSubjectBodyAccData) <- list ( NULL, c("gyroAngularVelocity_X_Mean","gyroAngularVelocity_X_StdDev","gyroAngularVelocity_Y_Mean","gyroAngularVelocity_Y_StdDev","gyroAngularVelocity_Z_Mean","gyroAngularVelocity_Z_StdDev"))
dimnames(testSubjectGyroData) <- list ( NULL, c("bodyAcceleration_X_Mean","bodyAcceleration_X_StdDev","bodyAcceleration_Y_Mean","bodyAcceleration_Y_StdDev","bodyAcceleration_Z_Mean","bodyAcceleration_Z_StdDev"))
dimnames(testSubjectTotalAccData) <- list ( NULL, c("totalAcceleration_X_Mean","totalAcceleration_X_StdDev","totalAcceleration_Y_Mean","totalAcceleration_Y_StdDev","totalAcceleration_Z_Mean","totalAcceleration_Z_StdDev"))
testSubjectActivityData <- cbind(testSubjectData, testLabelData, testData, testSubjectBodyAccData, testSubjectGyroData, testSubjectTotalAccData)
dim(testSubjectActivityData)


# ----------------------------------------------------------------------------------------
# Repeat the same read data process for the train subjects
# ----------------------------------------------------------------------------------------

# Read the train data set.  It has 561 delimited columns for each of the measured features.
# Use the feature names from above metadata to relabel the columns accordingly.
con <- file("./UCI HAR Dataset/train/X_train.txt","r")
trainData <- read.delim(file=con, header=FALSE, sep="")
close(con)
dim(trainData)
names(trainData) <- featureLabels$FeatureLabel
head(trainData, 100)

# ----------------------------------------------------------------------------------------
# The use of Inertial Signals is optional.  Getting the mean and std. dev. for each measurement.
# ----------------------------------------------------------------------------------------
# Read the train subjects body_acc_x_train.txt data and compute the avarage and std. dev.
# for each row of 128 data values in the vector.
con <- file("./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt","r")
trainBodyAccXData <- read.delim(file=con, header=FALSE, sep="")
close(con)
dim(trainBodyAccXData)
# Get the mean and std. dev. for the first row to validate
mean(as.numeric (trainBodyAccXData[1,]), na.rm=TRUE)
sd(as.numeric (trainBodyAccXData[1,]), na.rm=TRUE)
head(rowMeans(trainBodyAccXData))
head(apply(trainBodyAccXData, 1, sd))
trainBodyAccXMean <- rowMeans(trainBodyAccXData)
trainBodyAccXSTD <- apply(trainBodyAccXData, 1, sd)

# Read the train subjects body_acc_y_train.txt data and compute the avarage and std. dev.
# for each row of 128 data values in the vector.
con <- file("./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt","r")
trainBodyAccYData <- read.delim(file=con, header=FALSE, sep="")
close(con)
dim(trainBodyAccYData)
# Get the mean and std. dev. for the first row to validate
mean(as.numeric (trainBodyAccYData[1,]), na.rm=TRUE)
sd(as.numeric (trainBodyAccYData[1,]), na.rm=TRUE)
head(rowMeans(trainBodyAccYData))
head(apply(trainBodyAccYData, 1, sd))
trainBodyAccYMean <- rowMeans(trainBodyAccYData)
trainBodyAccYSTD <- apply(trainBodyAccYData, 1, sd)

# Read the train subjects body_acc_z_train.txt data and compute the avarage and std. dev.
# for each row of 128 data values in the vector.
con <- file("./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt","r")
trainBodyAccZData <- read.delim(file=con, header=FALSE, sep="")
close(con)
dim(trainBodyAccZData)
# Get the mean and std. dev. for the first row to validate
mean(as.numeric (trainBodyAccZData[1,]), na.rm=TRUE)
sd(as.numeric (trainBodyAccZData[1,]), na.rm=TRUE)
head(rowMeans(trainBodyAccZData))
head(apply(trainBodyAccZData, 1, sd))
trainBodyAccZMean <- rowMeans(trainBodyAccZData)
trainBodyAccZSTD <- apply(trainBodyAccZData, 1, sd)
# ----------------------------------------------------------------------------------------
# Read the train subjects body_gyro_x_train.txt data and compute the avarage and std. dev.
# for each row of 128 data values in the vector.
con <- file("./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt","r")
trainGyroXData <- read.delim(file=con, header=FALSE, sep="")
close(con)
dim(trainGyroXData)
# Get the mean and std. dev. for the first row to validate
mean(as.numeric (trainGyroXData[1,]), na.rm=TRUE)
sd(as.numeric (trainGyroXData[1,]), na.rm=TRUE)
head(rowMeans(trainGyroXData))
head(apply(trainGyroXData, 1, sd))
trainGyroXMean <- rowMeans(trainGyroXData)
trainGyroXSTD <- apply(trainGyroXData, 1, sd)

# Read the train subjects body_gyro_y_train.txt data and compute the avarage and std. dev.
# for each row of 128 data values in the vector.
con <- file("./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt","r")
trainGyroYData <- read.delim(file=con, header=FALSE, sep="")
close(con)
dim(trainGyroYData)
# Get the mean and std. dev. for the first row to validate
mean(as.numeric (trainGyroYData[1,]), na.rm=TRUE)
sd(as.numeric (trainGyroYData[1,]), na.rm=TRUE)
head(rowMeans(trainGyroYData))
head(apply(trainGyroYData, 1, sd))
trainGyroYMean <- rowMeans(trainGyroYData)
trainGyroYSTD <- apply(trainGyroYData, 1, sd)

# Read the train subjects body_gyro_z_train.txt data and compute the avarage and std. dev.
# for each row of 128 data values in the vector.
con <- file("./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt","r")
trainGyroZData <- read.delim(file=con, header=FALSE, sep="")
close(con)
dim(trainGyroZData)
# Get the mean and std. dev. for the first row to validate
mean(as.numeric (trainGyroZData[1,]), na.rm=TRUE)
sd(as.numeric (trainGyroZData[1,]), na.rm=TRUE)
head(rowMeans(trainGyroZData))
head(apply(trainGyroZData, 1, sd))
trainGyroZMean <- rowMeans(trainGyroZData)
trainGyroZSTD <- apply(trainGyroZData, 1, sd)
# ----------------------------------------------------------------------------------------
# Read the train subjects total_acc_x_train.txt data and compute the avarage and std. dev.
# for each row of 128 data values in the vector.
con <- file("./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt","r")
trainTotalAccXData <- read.delim(file=con, header=FALSE, sep="")
close(con)
dim(trainTotalAccXData)
# Get the mean and std. dev. for the first row to validate
mean(as.numeric (trainTotalAccXData[1,]), na.rm=TRUE)
sd(as.numeric (trainTotalAccXData[1,]), na.rm=TRUE)
head(rowMeans(trainTotalAccXData))
head(apply(trainTotalAccXData, 1, sd))
trainTotalAccXMean <- rowMeans(trainTotalAccXData)
trainTotalAccXSTD <- apply(trainTotalAccXData, 1, sd)

# Read the train subjects total_acc_y_train.txt data and compute the avarage and std. dev.
# for each row of 128 data values in the vector.
con <- file("./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt","r")
trainTotalAccYData <- read.delim(file=con, header=FALSE, sep="")
close(con)
dim(trainTotalAccYData)
# Get the mean and std. dev. for the first row to validate
mean(as.numeric (trainTotalAccYData[1,]), na.rm=TRUE)
sd(as.numeric (trainTotalAccYData[1,]), na.rm=TRUE)
head(rowMeans(trainTotalAccYData))
head(apply(trainTotalAccYData, 1, sd))
trainTotalAccYMean <- rowMeans(trainTotalAccYData)
trainTotalAccYSTD <- apply(trainTotalAccYData, 1, sd)

# Read the train subjects total_acc_z_train.txt data and compute the avarage and std. dev.
# for each row of 128 data values in the vector.
con <- file("./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt","r")
trainTotalAccZData <- read.delim(file=con, header=FALSE, sep="")
close(con)
dim(trainTotalAccZData)
# Get the mean and std. dev. for the first row to validate
mean(as.numeric (trainTotalAccZData[1,]), na.rm=TRUE)
sd(as.numeric (trainTotalAccZData[1,]), na.rm=TRUE)
head(rowMeans(trainTotalAccZData))
head(apply(trainTotalAccZData, 1, sd))
trainTotalAccZMean <- rowMeans(trainTotalAccZData)
trainTotalAccZSTD <- apply(trainTotalAccZData, 1, sd)
# ----------------------------------------------------------------------------------------
# End of optional data collection
# ----------------------------------------------------------------------------------------




# Read the train activity IDs.  Each row identifies the Activity ID for each vector from the
# previous feature measurement file.
# Use the activity names from above metadata to merge by ActivityID for determine row activity names accordingly.
con <- file("./UCI HAR Dataset/train/y_train.txt","r")
trainLabelData <- read.delim(file=con, header=FALSE, sep="")
close(con)
dim(trainLabelData)
names(trainLabelData) <- "ActivityID"
#trainLabelData <- merge(trainLabelData, activityLabels, sort=FALSE)
trainLabelData <- join(trainLabelData, activityLabels)
head(trainLabelData, 100)

# Read the train subjects.  Each row is identified by a subject ID
con <- file("./UCI HAR Dataset/train/subject_train.txt","r")
trainSubjectData <- read.delim(file=con, header=FALSE, sep="")
close(con)
dim(trainSubjectData)
names(trainSubjectData) <- "SubjectID"
head(trainSubjectData, 100)

# Join all the three train data sets together - SubjectID, ActivityID/Name, Features Vector
trainSubjectBodyAccData <- cbind(trainBodyAccXMean, trainBodyAccXSTD, trainBodyAccYMean, trainBodyAccYSTD, trainBodyAccZMean, trainBodyAccZSTD)
trainSubjectGyroData <- cbind(trainGyroXMean, trainGyroXSTD, trainGyroYMean, trainGyroYSTD, trainGyroZMean, trainGyroZSTD)
trainSubjectTotalAccData <- cbind(trainTotalAccXMean, trainTotalAccXSTD, trainTotalAccYMean, trainTotalAccYSTD, trainTotalAccZMean, trainTotalAccZSTD)
dimnames(trainSubjectBodyAccData) <- list ( NULL, c("gyroAngularVelocity_X_Mean","gyroAngularVelocity_X_StdDev","gyroAngularVelocity_Y_Mean","gyroAngularVelocity_Y_StdDev","gyroAngularVelocity_Z_Mean","gyroAngularVelocity_Z_StdDev"))
dimnames(trainSubjectGyroData) <- list ( NULL, c("bodyAcceleration_X_Mean","bodyAcceleration_X_StdDev","bodyAcceleration_Y_Mean","bodyAcceleration_Y_StdDev","bodyAcceleration_Z_Mean","bodyAcceleration_Z_StdDev"))
dimnames(trainSubjectTotalAccData) <- list ( NULL, c("totalAcceleration_X_Mean","totalAcceleration_X_StdDev","totalAcceleration_Y_Mean","totalAcceleration_Y_StdDev","totalAcceleration_Z_Mean","totalAcceleration_Z_StdDev"))
trainSubjectActivityData <- cbind(trainSubjectData, trainLabelData, trainData, trainSubjectBodyAccData, trainSubjectGyroData, trainSubjectTotalAccData)
dim(trainSubjectActivityData)



# Join test and train data sets
allSubjectActivityData <- rbind(testSubjectActivityData, trainSubjectActivityData)
summary_allSubjectActivityData <- summary(allSubjectActivityData)
#View(allSubjectActivityData)
#View(allSubjectActivityData[,c(1:10,565:582)])

# Check if there are any NA in the data
all(colSums(is.na(allSubjectActivityData)) == 0)

# Creates the tidy data set summarizing the data by getting the mean of each measurement,
# sorted by subject and activity
groups <- list(allSubjectActivityData$SubjectID, allSubjectActivityData$ActivityID, allSubjectActivityData$ActivityLabel)
meanSummary_allSubjectActivityData <- aggregate(allSubjectActivityData[ , 4:ncol(allSubjectActivityData)], groups, mean)
names(meanSummary_allSubjectActivityData)[1:3] <- c("SubjectID","ActivityID","ActivityLabel")
sorted_meanSummary_allSubjectActivityData <- meanSummary_allSubjectActivityData[order(meanSummary_allSubjectActivityData$SubjectID, meanSummary_allSubjectActivityData$ActivityID, meanSummary_allSubjectActivityData$ActivityLabel), ]


# Write the results to a file
con <- file("./tidy.txt","w")
write.csv(sorted_meanSummary_allSubjectActivityData, file = con, quote = TRUE, row.names = FALSE)
close(con)
