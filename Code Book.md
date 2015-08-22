#Code Book 
## Description of the variables used

1. activity_id_test: These are 2947 observations of activity labels of 'test' file.
2. activity_id-train: These are 7352 observations of activity lables of 'train' file.
3. combined_data: This is a dataframe combining 'test' and 'train' files with 10299 observations and 561 variables.
4. extracted_combined_data: This data is extracted from combined_data having columns with respect to the variable names containing 'mean' and 'std' in their variable names.  
5. extracted_combined_df: This is a data frame created by adding columns 'subject_id' and 'activity_id' to 'extracted_combined_data'.
6. data: This is a dataset obtained from 'extracted_combined_data' by gathering the variables in rows. The new column names are 'subject_id', 'activity', 'variable', and 'mean'
7. grouped_data: this dataset is the 'data' grouped by 'subject_id','activity' and 'variable'.
8. tidy_data: is the data with the average of each variable for each activity and each subject.
9. activity_labels: are the labels identifying the activities
10. features: list of variable names in test or train data
11. subject_id_test: are labels identifying subjects in test data
12. subject_id_train: are labels identifying subjects in train data
13. test: test set
14. train: training set
