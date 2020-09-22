# Coursera Getting and Cleaning Data - Week 4 Course Project

Author: FKurzhals

Date: 2020-09-22

### Data Description

- Dataset Name: Human Activity Reconition - Data collected from the accelerometers from the Samsung Galaxy S smartphone.
- Download Link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Oringial Content

* The original dataset contained the following files which were used in this project:
        - A README.txt file with details about the expermient and the dataset contents
        - The features_info.txt file with information about the variables
        - The features.txt file with a table containing all the 561 analysed variables
        - The activity_labels.txt file with 6 different activities and their ID's
        - A set of files called test, containing a subject_test, X_test and y_test files
        - A set of files called train, containing a subject_train, X_train and y_train files

### Getting and Cleaning Process

* The objective of the project was to create a R script called run_analysis.R which would do the following:
 1. Donwload the dataset and unzip it under a folder called UCI HAR Dataset
 2. Read the features_info, activity_labels and the sets of test and training files into R
 3. Merge the previously read data frames into one single dataset
 4. Extract only the variables containing information about the mean and standard deviation for each measurement of the experiment
 5. Change the activity ID's for their real description over the dataset
 6. Label the dataset variables to descriptive ones
 7. From the previously formatted dataset, create a new tidy dataset containing the average of each variable grouped by activity and subject
 8. Generate a text file from that tidy dataset

* The final tidy dataset must contain the following information into one single text file:
   + The subjects groups
   + The activities groups,
   + The features used in the experiment:
      - tBodyAcc-XYZ
      - tGravityAcc-XYZ
      - tBodyAccJerk-XYZ
      - tBodyGyro-XYZ
      - tBodyGyroJerk-XYZ
      - tBodyAccMag
      - tGravityAccMag
      - tBodyAccJerkMag
      - tBodyGyroMag
      - tBodyGyroJerkMag
      - fBodyAcc-XYZ
      - fBodyAccJerk-XYZ
      - fBodyGyro-XYZ
      - fBodyAccMag
      - fBodyAccJerkMag
      - fBodyGyroMag
      - fBodyGyroJerkMag
  + The means and standard deviation measurements previously selected for each feature:
    - mean(): Mean value
    - meanFreq(): Weighted average of the frequency components to obtain a mean frequency
    - std(): Standard deviation

### Final Result

The output of the R script is a tidy dataset containing the Groups of activities and subjects and their respective measurements means for each of the features.
