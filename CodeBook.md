CodeBook
================

### by David Esteban Triviño

## Variables

The features selected for this database come from the accelerometer and
gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain
signals (prefix ‘t’ to denote time) were captured at a constant rate of
50 Hz. Then they were filtered using a median filter and a 3rd order low
pass Butterworth filter with a corner frequency of 20 Hz to remove
noise. Similarly, the acceleration signal was then separated into body
and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ)
using another low pass Butterworth filter with a corner frequency of 0.3
Hz.

Subsequently, the body linear acceleration and angular velocity were
derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and
tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional
signals were calculated using the Euclidean norm (tBodyAccMag,
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these
signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ,
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the ‘f’ to
indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for
each pattern: ‘-XYZ’ is used to denote 3-axial signals in the X, Y and Z
directions.

  - tBodyAcc-XYZ
  - tGravityAcc-XYZ
  - tBodyAccJerk-XYZ
  - tBodyGyro-XYZ
  - tBodyGyroJerk-XYZ
  - tBodyAccMag
  - tGravityAccMag
  - tBodyAccJerkMag
  - tBodyGyroMag
  - tBodyGyroJerkMag
  - fBodyAcc-XYZ
  - fBodyAccJerk-XYZ
  - fBodyGyro-XYZ
  - fBodyAccMag
  - fBodyAccJerkMag
  - fBodyGyroMag
  - fBodyGyroJerkMag

## Data

The data linked to from the course website represent data collected from
the accelerometers from the Samsung Galaxy S smartphone. A full
description is available at the site where the data was obtained:

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

There were train and test data sets.

## Transformations to tidy\_data

1.  Merge the data sets into train and test data sets.
2.  Merge train and test data sets into data1.
3.  Add the correct names of variables with features information.
4.  Select just the measures with mean and standard desviation into
    data2
5.  Transform activity column into factor and change the levels with the
    names.
6.  From the data2 created a tidy\_data with the average of each
    variable for each activity and each subject.
7.  Export the tidy\_data in text format.

## Bibliography

  - Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge
    L. Reyes-Ortiz. A Public Domain Dataset for Human Activity
    Recognition Using Smartphones. 21th European Symposium on Artificial
    Neural Networks, Computational Intelligence and Machine Learning,
    ESANN 2013. Bruges, Belgium 24-26 April 2013.
