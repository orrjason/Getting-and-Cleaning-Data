# Part 1 - Merges the training and the test sets to create one data set.

X_train <- read.table("train/X_train.txt")
X_test <- read.table("test/X_test.txt")
X <- rbind(X_train, X_test)
Y_train <- read.table("train/y_train.txt")
Y_test <- read.table("test/y_test.txt")
Y <- rbind(Y_train, Y_test)
S_train <- read.table("train/subject_train.txt")
S_test <- read.table("test/subject_test.txt")
S <- rbind(S_train, S_test)

# Part 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("features.txt")
mean_std_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, mean_std_features]
names(X) <- features[mean_std_features, 2]

# Part 3 - Uses descriptive activity names to name the activities in the data set
activities <- read.table("activity_labels.txt")
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"
# Part 4 - Appropriately labels the data set with descriptive variable names. 
names(S) <- "subject"
mcd <- cbind(S, Y, X)
write.table(mcd, "merged_clean_data.txt", row.name=FALSE)
# Part 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
uniques = unique(S)[,1]
length_Subjects = length(unique(S)[,1])
length_Activities = length(activities[,1])
number_Columns = dim(mcd)[2]
averages = mcd[1:(length_Subjects*length_Activities), ]
row = 1
for (s in 1:length_Subjects) {
  for (a in 1:length_Activities) {
    averages[row, 1] = uniques[s]
    averages[row, 2] = activities[a, 2]
    A <- mcd[mcd$subject==s & mcd$activity==activities[a, 2], ]
    averages[row, 3:number_Columns] <- colMeans(A[, 3:number_Columns])
    row = row+1
  }
}
write.table(averages, "data_set_with_the_averages.txt", row.name=FALSE)
