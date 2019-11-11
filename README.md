# Getting-and-Cleaning-Data-Course-Project
The dataset is the activity measurments of 30 people as recorded by a smartphone device. The subjects were randomly 
assigned to test or training groups.

The script "run_analysis.R" was written to create a tidy dataset from the test and training data sets.

A tidy data set containing average of the measurements per subject and per activity was created as follows:

The compressed data set is downloaded from the url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles
%2FUCI%20HAR%20Dataset.zip and unzipped.

The test and training data sets were merged and means and standard deviations of measurements were selected for 
further anaysis.

The data set was grouped by subject and activity and the average values of the measurements were calculated per group.

The measurements were given descriptive names and the final tidy data set called "Tidy_Data.txt" was written to disk.
