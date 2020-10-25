README
================

## Getting and Cleaning Data Course Project

### by David Esteban Triviño

The data linked to from the course website represent data collected from
the accelerometers from the Samsung Galaxy S smartphone. A full
description is available at the site where the data was obtained:

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

### Used packages

``` r
require(dplyr)
```

### Reading info

``` r
features <- read.table("./UCI HAR Dataset/features.txt")
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
```

### Reading the test data

``` r
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
stest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
```

### read the train data

``` r
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
strain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
```

### Merge columns in *test* and *train* data sets

``` r
test <- bind_cols(ytest, stest, xtest)
train <- bind_cols(ytrain, strain, xtrain)
```

### data1

Merge the *train* and *test* data sets. The first column is *set*, it
has the information from the set origin (train or test).

``` r
data1 <- bind_rows("train"=train, "test"=test, .id = "set")
```

### Appropriately labels the data set with descriptive variable names

I changes the columns names from data1, with the *features* information

``` r
colnames(data1) <- c("set", "activity", "subject", features$V2)
```

### Extracts only the measurements on the mean and standard deviation for each measurement

Basically I select the first three columns and the columns that contains
*mean()* or *std()* in the names.

``` r
data2 <- data1 %>% select(c(1:3)|((contains("mean()") | contains("std()"))))
```

### Uses descriptive activity names to name the activities in the data set

With *activity* information I change the *activity* from *data2* into
factor and change the levels with the names of activities.

``` r
data2$activity <- as.factor(data2$activity)
levels(data2$activity) <- activity$V2
```

### Tidy data

From the data set *data2*, creates a second, independent tidy data set
with the average of each variable for each activity and each subject.
After I changed the variable’s names erasing “mean()”.

``` r
data3 <- data2 %>% select(c(2:3) | contains("mean()")) %>%
    group_by(activity, subject) %>% summarise_all(mean)
names(data3) <- sub("-mean\\(\\)","",names(data3))
data3
```

    ## # A tibble: 180 x 35
    ## # Groups:   activity [6]
    ##    activity subject `tBodyAcc-X` `tBodyAcc-Y` `tBodyAcc-Z` `tGravityAcc-X`
    ##    <fct>      <int>        <dbl>        <dbl>        <dbl>           <dbl>
    ##  1 WALKING        1        0.277      -0.0174       -0.111           0.935
    ##  2 WALKING        2        0.276      -0.0186       -0.106           0.913
    ##  3 WALKING        3        0.276      -0.0172       -0.113           0.937
    ##  4 WALKING        4        0.279      -0.0148       -0.111           0.964
    ##  5 WALKING        5        0.278      -0.0173       -0.108           0.973
    ##  6 WALKING        6        0.284      -0.0169       -0.110           0.958
    ##  7 WALKING        7        0.276      -0.0187       -0.111           0.933
    ##  8 WALKING        8        0.275      -0.0187       -0.107           0.914
    ##  9 WALKING        9        0.279      -0.0181       -0.111           0.952
    ## 10 WALKING       10        0.279      -0.0170       -0.109           0.963
    ## # ... with 170 more rows, and 29 more variables: `tGravityAcc-Y` <dbl>,
    ## #   `tGravityAcc-Z` <dbl>, `tBodyAccJerk-X` <dbl>, `tBodyAccJerk-Y` <dbl>,
    ## #   `tBodyAccJerk-Z` <dbl>, `tBodyGyro-X` <dbl>, `tBodyGyro-Y` <dbl>,
    ## #   `tBodyGyro-Z` <dbl>, `tBodyGyroJerk-X` <dbl>, `tBodyGyroJerk-Y` <dbl>,
    ## #   `tBodyGyroJerk-Z` <dbl>, tBodyAccMag <dbl>, tGravityAccMag <dbl>,
    ## #   tBodyAccJerkMag <dbl>, tBodyGyroMag <dbl>, tBodyGyroJerkMag <dbl>,
    ## #   `fBodyAcc-X` <dbl>, `fBodyAcc-Y` <dbl>, `fBodyAcc-Z` <dbl>,
    ## #   `fBodyAccJerk-X` <dbl>, `fBodyAccJerk-Y` <dbl>, `fBodyAccJerk-Z` <dbl>,
    ## #   `fBodyGyro-X` <dbl>, `fBodyGyro-Y` <dbl>, `fBodyGyro-Z` <dbl>,
    ## #   fBodyAccMag <dbl>, fBodyBodyAccJerkMag <dbl>, fBodyBodyGyroMag <dbl>,
    ## #   fBodyBodyGyroJerkMag <dbl>

#### Export data in text format

``` r
write.table(data3, "tidy_data.txt")
```

## Bibliography

  - Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge
    L. Reyes-Ortiz. A Public Domain Dataset for Human Activity
    Recognition Using Smartphones. 21th European Symposium on Artificial
    Neural Networks, Computational Intelligence and Machine Learning,
    ESANN 2013. Bruges, Belgium 24-26 April 2013.
