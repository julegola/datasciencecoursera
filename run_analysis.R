library(dplyr)

## Step 1: Loads and merges the training and the test sets to create one data set.
features <- read.table("./UCI HAR Dataset/features.txt")
data_test_X <- read.table("./UCI HAR Dataset/test/X_test.txt")
data_test_y <- read.table("./UCI HAR Dataset/test/y_test.txt")
data_train_X <- read.table("./UCI HAR Dataset/train/X_train.txt")
data_train_y <- read.table("./UCI HAR Dataset/train/y_train.txt")
labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
subjects_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subjects_test <- read.table("././UCI HAR Dataset/test/subject_test.txt")

data_X <- rbind(data_test_X, data_train_X)
data_y <- rbind(data_test_y, data_train_y)
subjects <- rbind(subjects_test, subjects_train)

colnames(data_X) <- features$V2

## Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
data <- cbind(data_X[, grepl("mean\\(\\)", colnames(data_X))], data_X[, grepl("std\\(\\)", colnames(data_X))])
data <- cbind(data_y, data)
data <- cbind(subjects, data)

## remove unused data frames
rm("data_train_X", "data_test_X", "data_train_y", "data_test_y", "features", "subjects_train", "subjects_test", "data_X", "data_y", "subjects")

## Step 3: Uses descriptive activity names to name the activities in the data set
data[, 2] <- factor(data[, 2], labels = labels$V2)

## Step 4: Appropriately labels the data set with descriptive variable names. 
names(data) <- gsub("-", "",names(data))
names(data) <- gsub("\\(\\)", "",names(data))
names(data) <- gsub("BodyBody", "Body",names(data)) ## fixes error in original data
names(data) <- gsub("tBody", "timeBody", names(data))
names(data) <- gsub("tGravity", "timeGravity", names(data))
names(data) <- gsub("fBody", "frequBody", names(data))
names(data) <- gsub("fGravity", "frequGravity", names(data))
names(data) <- gsub("Acc", "Accelero", names(data))
names(data) <- gsub("Mag", "Magnitude", names(data))
names(data) <- gsub("mean", "Mean", names(data))
names(data) <- gsub("std", "Std", names(data))

names(data)[1] <- "subject"
names(data)[2] <- "activity"

## Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
result <- data %>%
  group_by(activity, subject) %>%
  summarise_each(funs(mean))
  
 ## adjusts variable names
names(result)[3:68] <- paste( "mean", 
                              toupper(substring(names(result)[3:68], 1, 1)), 
                              substring(names(result)[3:68], 2), sep = "" )

## Output
View(result)

