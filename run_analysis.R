library(dplyr)
filename <- "getdata_projectfiles_UCI HAR Dataset.zip"
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="curl")}  

if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) }

#Data frames
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")

x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)

Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, Y, X)

TidyDataSet <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))
TidyDataSet$code <- activities[TidyDataSet$code, 2]

names(TidyDataSet)[2] = "activity"
names(TidyDataSet)<-gsub("Acc", "Accelerometer", names(TidyDataSet))
names(TidyDataSet)<-gsub("Gyro", "Gyroscope", names(TidyDataSet))
names(TidyDataSet)<-gsub("BodyBody", "Body", names(TidyDataSet))
names(TidyDataSet)<-gsub("Mag", "Magnitude", names(TidyDataSet))

names(TidyDataSet)<-gsub("^t", "Time", names(TidyDataSet))
names(TidyDataSet)<-gsub("^f", "Frequency", names(TidyDataSet))
names(TidyDataSet)<-gsub("tBody", "TimeBody", names(TidyDataSet))
names(TidyDataSet)<-gsub("-mean()", "Mean", names(TidyDataSet), ignore.case = TRUE)

names(TidyDataSet)<-gsub("-std()", "STD", names(TidyDataSet), ignore.case = TRUE)
names(TidyDataSet)<-gsub("-freq()", "Frequency", names(TidyDataSet), ignore.case = TRUE)
names(TidyDataSet)<-gsub("angle", "Angle", names(TidyDataSet))
names(TidyDataSet)<-gsub("gravity", "Gravity", names(TidyDataSet))

FinalDataSet <- TidyDataSet %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(FinalDataSet, "FinalDataSet.txt", row.name=FALSE)

str(FinalDataSet)

FinalDataSet









