==================================================================
Human Activity Recognition Using Smartphones Dataset
==================================================================

Introduction
------------
This repository contains files for the course project for the Coursera course "Getting and Cleaning data".

About data
----------
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were processed and mean was calculated for each mean and standart value.


The dataset includes the following files:
----------------------------------------

* 'README.md'

* 'CodeBook.md': Shows information about the variables used on the feature vector.

* 'run_analysis.r': Shows the code used to create the tidy data

* 'Final.txt': text file with the tidy data


About the script and the tidy dataset
-------------------------------------
The script created as run_analysis.R merge the test and training sets together and create a tidy data from raw data.
Prerequisites for this script:

1. The UCI HAR Dataset must be availble in a directory called "UCI HAR Dataset".
2. Only files from UCI HAR Dataset should be in this directory.
3. Files README.txt and features_info.txt from UCI HAR Dataset will be deleted by script

After merging testing and training data, labels are added and only columns that contains mean or standard deviation were kept.

the script will create a tidy data set containing the means of all the columns per subject and activity.
This tidy dataset will be written to a text file called Final.txt, which can also be found in this repository.