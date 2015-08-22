# Getting-and-cleaning-data: Course Project
## Human Activity Recognition using smartphones
###The project requires to submit a R script that
1. Merges the training and the test sets to create one data set.

  a. The script first loads the test and train data from the downloaded text files.
  
  b. Then binds these two data by rows as both the data sets have same number of variables.
  
2. Extracts only the measurements on the mean and standard deviation for each measurement. 

  a. Using the 'features.txt' file, which stores variable names, only the columns that contain 'mean' and 'std' are extracted.
  
3. Uses descriptive activity names to name the activities in the data set
  
  a. After loading 'subject_labels' and 'activity_labels', these are added to the combined dataset.
  
4. Appropriately labels the data set with descriptive variable names. 

  a. Using 'features' file, the columns are named.
  
5. From the data set in step 4, creates a second, independent tidy data set 
with the average of each variable for each activity and each subject.

  a. Using packages 'dplyr' and 'tidyr' a tidy data is created with 4 variables: 'subject_id','activity','variable',and 'mean'.
