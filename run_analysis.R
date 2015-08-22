#A. First set the working directory of your choice.
setwd("D:/ACP/Self/Coursera/Getting and cleaning data")

#B. create a directory named 'data' for storing the data.
#if(dir.exists("data")){
#       message("Directory already exists!")} else{
#              message("Creating directory...")
#             dir.create("data")
#            message("Directory created.")
#   }

#C.Download the file in 'data' directory
#fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(fileUrl,destfile="/data")


#D. Change the working directory to 'data'
setwd("data")

#E.Unzip the downloaded file in present directory
#unzip("getdata-projectfiles-UCI HAR Dataset.zip",exdir = ".")

#F. set the wd to new dir
setwd("UCI HAR Dataset")

#G. See the list of files in the present working directory.
list.files(recursive = T)


#1. Merges the training and the test sets to create one data set.

#A.Load test & train data
test <- read.table("test/X_test.txt") #read the test data
train <- read.table("train/X_train.txt") #Read training data
combined_data <- rbind(test,train) #bind 'test' and 'train' by rows

#2. Extract only the measurements on the mean and standard deviation for each measurement.
features <- read.table("features.txt",stringsAsFactors = FALSE)[,2] #These are variable names.
extracted_combined_data <- combined_data[,(grep("mean|std",features,value=F))]

#3. Uses descriptive activity names to name the activities in the data set

# A. Load activity and subject labels for both 'test' and 'train' data.

activity_id_test <- read.table("test/y_test.txt") #test_label is labels for the activities.

subject_id_test <- read.table("test/subject_test.txt") #subject_test is subject labels

activity_id_train <- read.table("train/y_train.txt") #train_label is label for activities

subject_id_train <- read.table("train/subject_train.txt") #subject_train is subject labels.


#B. Create a data frame with 'subject', 'activity' and 'combined data'
extracted_combined_df <- data.frame(subject_id=c(subject_id_test[,1],subject_id_train[,1]),activity_id=c(activity_id_test[,1],activity_id_train[,1]),extracted_combined_data)

#C.Name the activity_id with their discritive names
activity_labels <- read.table("activity_labels.txt")[,2]
activity_labels

extracted_combined_df[,2]=activity_labels[extracted_combined_df[,2]]
names(extracted_combined_df)[2] <- "activity"

#4. Labels to the data set with descriptive variable names was already given before the data was combined.
#names(extracted_combined_df)[-(1:2)] <- features[grepl("mean|std",features)]

names(extracted_combined_df)[-(1:2)] <- grep("mean|std",features,value=T)

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(tidyr)
data <- gather(extracted_combined_df,feature,value,-c(subject_id,activity))

library(dplyr)
grouped_data <- group_by(data,subject_id,activity,feature)
tidy_data <- summarise(grouped_data,mean=mean(value))
View(tidy_data)
write.table(tidy_data, file = "../tidy_data.txt",row.names = F)
