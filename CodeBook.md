### Purpose of this project
=======================================================================================================
The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

Submission: 
1) a tidy data set as described below, 
2) a link to a Github repository with your script for performing the analysis, and 
3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. I will also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.



### Data Source
=======================================================================================================
https://archive.ics.uci.edu/dataset/240/human+activity+recognition+using+smartphones

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  

  
### Dataset Information
=======================================================================================================
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.



### Additional Variable Information
=======================================================================================================
For each record in the dataset it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.

- Triaxial Angular velocity from the gyroscope. 

- A 561-feature vector with time and frequency domain variables. 

- Its activity label. 

- An identifier of the subject who carried out the experiment. 



### Task
=======================================================================================================
1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



### The dataset includes the following files:
=======================================================================================================
- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 



### Brief walkthrough of thought process
### Data to variables

    features <- features.txt:
    The chosen features for this dataset are derived from the raw signals of the accelerometer and gyroscope, specifically the 3-axial signals tAcc-XYZ and tGyro-XYZ.

    activities <- activity_labels.txt:
    Enumerated are the activities conducted during the acquisition of corresponding measurements, accompanied by their respective codes (labels).

    subject_test <- test/subject_test.txt:
    Comprising observational data, this set pertains to the testing phase and involves 9 out of 30 volunteer subjects.

    x_test <- test/X_test.txt:
    This dataset encompasses recorded features from the testing phase.

    y_test <- test/y_test.txt:
    Within this dataset lie the code labels associated with the test data activities.

    subject_train <- test/subject_train.txt:
    This dataset comprises observational data from the training phase, involving 21 out of 30 volunteer subjects.

    x_train <- test/X_train.txt:
    This dataset encapsulates recorded features from the training data.

    y_train <- test/y_train.txt:
    This dataset encompasses the code labels associated with the activities in the training data.

### Combines the training and test datasets into a cohesive dataset.

    Create X by merging x_train and x_test using the rbind() function.
    Generate Y by merging y_train and y_test using the rbind() function.
    Formulate Subject by merging subject_train and subject_test using the rbind() function.
    Construct Merged_Data by merging Subject, Y, and X using the cbind() function.

### Extracts solely the measurements pertaining to the mean and standard deviation for each recorded measurement.

Create TidyDataSetSet by subsetting Merged_Data, retaining only the columns: subject, code, and measurements related to the mean and standard deviation (std) for each observation.

        
### Utilizes descriptive activity names to label the activities within the dataset.

Replace all numeric codes in the "code" column of TidyDataSet with the corresponding activities retrieved from the second column of the "activities" variable.


### Apply proper labels to the dataset with descriptive variable names:

    Rename the "code" column in TidyDataSet to "activities."
    Substitute "Acc" in column names with "Accelerometer."
    Replace "Gyro" in column names with "Gyroscope."
    Change "BodyBody" in column names to "Body."
    Replace "Mag" in column names with "Magnitude."
    For names starting with "f," replace with "Frequency."
    For names starting with "t," replace with "Time."

### From the dataset in step 4, generate a second, independent tidy dataset featuring the average of each variable for each activity and each subject:

    Formulate FinalDataSet by summarizing TidyDataSet, calculating the means of each variable for each activity and each subject, after grouping by subject and activity.
    Export FinalDataSet into a file named "FinalTinyDataSet.txt."



