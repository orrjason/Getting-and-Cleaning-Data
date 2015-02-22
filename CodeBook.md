The script run_analysis.R does the following:

1. Merges the training and the test sets to create one data set.
  This was done by reading the text files unzipped and combining them with the rbind function, creating data sets X, Y and S

2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  Only the columns with the mean and standard deviations are taken from dataset X. After extracting these columns, they are given the correct names per features.txt.

3. Uses descriptive activity names to name the activities in the data set
  The activity names and IDs from activity_labels.txt are substituted in the dataset Y.

4. Appropriately labels the data set with descriptive variable names. 
  As above and then written the merged clean file to the working directory

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  Create a new dataset with all the average measures for each subject and activity type called data_set_with_the_averages.txt
