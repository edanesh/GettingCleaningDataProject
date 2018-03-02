## Function "run_analysis" takes the data collected from the accelerometers of the Samsung Galaxy S smartphone, and: 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each ##    variable for each activity and each subject.

# step 1. reads train and test data files and combines relavant columns of each; then merges combined train and test data into a single data set.

library(dplyr)
library(data.table)
library(stringr)

subject_train <- fread("./train/subject_train.txt", col.names = "Subject")
y_train <- fread("./train/y_train.txt", col.names = "Activity")
X_train <- fread("./train/X_train.txt")
comb_train <- cbind(subject_train, y_train, X_train )
subject_test <- fread("./test/subject_test.txt", col.names = "Subject")
y_test <- fread("./test/y_test.txt", col.names = "Activity")
X_test <- fread("./test/X_test.txt")
comb_test <- cbind(subject_test, y_test, X_test)

myData <- bind_rows(comb_train, comb_test)

# step 2. reads features data file, tidies up variable names and searches for the requested measurments (variables) and selects them from the data set.

features <- read.table("features.txt", col.names = c("id", "feat_name"))
tidy_feat <- (feat_name = features$feat_name %>% sub("^t", "Time", .) %>% sub("\\(t", "(Time", .) %>% sub("^f", "Freq", .) %>% sub("-","", .) %>% sub("mean\\()","Mean", .) %>% sub("std\\()","Std", .) %>% sub("\\()","", .))
select_code <- grep("Mean|Std", tidy_feat)
select_name <- grep("Mean|Std", tidy_feat, value = TRUE)

selectData <- myData[ , c(1,2,select_code + 2), with=FALSE]

#step 3. reads activity labels data file and merges it in to the selected data set using index look up

activity <- fread("activity_labels.txt")
actData <- mutate(selectData, Activity = activity[selectData$Activity,V2])

#step 4. labels data set with appropriate/descriptive variable names extracted from features data

names(actData) <- c("Subject", "Activity", select_name)

#step 5. creates a new summary data set with requested info (mean value) of each variable for each activity//subject pair 

groupData <- group_by(actData, Subject, Activity)
summaryData <- summarize_all(groupData, mean)

#print(summaryData)







                 










