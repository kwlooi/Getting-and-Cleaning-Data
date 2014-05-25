Getting-and-Cleaning-Data
=========================

This project assumes the run_analysis.R script resides in the directory where there is a subdirectory "./UCI HAR Dataset"
which contains all the required data.  

The script performs the following:

1. read the metadata files containing the list of activity labels and feature labels.
2. read the test data set and merge with the metadata files.
3. perform the same read of the train data set and merge with the metadata files.
4. merge the test and train data sets as a complete data set.
5. aggregate the data by grouping by subject and activity ID.

Using library(plyr) to join data instead of merge to preserve ordering of rows.
