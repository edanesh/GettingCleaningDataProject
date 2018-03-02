=================================================
Samsung Galaxy S accelerometer and gyroscope data  
=================================================
ReadMe
Version 1.0
02 March 2018
Ehsan Danesh
=================================================
As part of the Getting and Cleaning Data course, the objective of this project is to collect, work with, and clean Samsung Galaxy S accelerometer and gyroscope data set.

Function "run_analysis" takes the data collected from the accelerometers of the Samsung Galaxy S smartphone, and:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This script performs the task in 5 steps:
        Step 1. reads train and test data files and combines relavant columns of each; then merges                      combined train and test data into a single data set.
        Step 2. reads features data file, tidies up variable names and searches for the requested                       measurments (variables) and selects them from the data set.
        Step 3. reads activity labels data file and merges it in to the selected data set using index                   look up
        Step 4. labels data set with appropriate/descriptive variable names extracted from features                     data
        Step 5. creates a new summary data set with requested info (mean value) of each variable for                    each activity//subject pair

Important: before running the script, make sure you download the data folder from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

and set the correct working directory (place the script file inside the main folder).