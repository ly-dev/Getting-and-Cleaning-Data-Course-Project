# 1. Merges the training and the test sets to create one data set.
tFeatures <- read.table("UCI HAR Dataset/features.txt")
tX_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names=tFeatures[,2])
tX_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names=tFeatures[,2])
tXMerged <- rbind(tX_test, tX_train)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
meanAndStandardFeatures <- tFeatures[grep("(mean|std)\\(", features[,2]),]
tMeanAndStandard <- tXMerged[,meanAndStandardFeatures[,1]]

# 3. Uses descriptive activity names to name the activities in the data set
tY_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = c('activity'))
tY_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = c('activity'))
tYMerged <- rbind(tY_test, tY_train)

tActivityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
for (i in 1:nrow(tActivityLabels)) {
        code <- as.numeric(tActivityLabels[i, 1])
        name <- as.character(tActivityLabels[i, 2])
        tYMerged[tYMerged$activity == code, ] <- name
}

# 4. Appropriately labels the data set with descriptive activity names. 
tXMergedWithLabels <- cbind(tYMerged, tXMerged)
tMeanAndStandardWithLables <- cbind(tYMerged, tMeanAndStandard)

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
tSubject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = c('subject'))
tSubject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = c('subject'))
tSubjectMerged <- rbind(tSubject_test, tSubject_train)
tAverages <- aggregate(tXMerged, by = list(activity = tYMerged[,1], tSubjectMerged = tSubjectMerged[,1]), mean)

write.csv(tAverages, file='result.txt', row.names=FALSE)