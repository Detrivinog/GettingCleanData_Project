## Packages
require(dplyr)

## reading info
features <- read.table("./UCI HAR Dataset/features.txt")
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")

## Reading the test data
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
stest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## read the train data
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
strain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

## merge columns in test and train data sets
test <- bind_cols(ytest, stest, xtest)
train <- bind_cols(ytrain, strain, xtrain)

## data set 1
data1 <- bind_rows("train"=train, "test"=test, .id = "set")

## Appropriately labels the data set with descriptive variable names
colnames(data1) <- c("set", "activity", "subject", features$V2)

## Extracts only the measurements on the mean and standard deviation for each measurement
data2 <- data1 %>% select(c(1:3)|((contains("mean()") | contains("std()"))))

## Uses descriptive activity names to name the activities in the data set

data2$activity <- as.factor(data2$activity)
levels(data2$activity) <- activity$V2
head(data2)

## From the data set in step 4, creates a second, independent tidy 
## data set with the average of each variable for each activity and each subject.

data3 <- data2 %>% select(c(2:3) | contains("mean()")) %>%
    group_by(activity, subject) %>% summarise_all(mean)
names(data3) <- sub("-mean\\(\\)","",names(data3))
data3

#Export data
write.table(data3, "tidy_data.txt", row.name = FALSE)
