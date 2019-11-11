## download compressed data
url<-""
if (!file.exists("project")){dir.create("project")}
options(download.file.method = "libcurl",urlmethod = "libcurl")
download.file(url,destfile="project/UCI_HAR_Dataset.zip")

## extract all files from the compressed data
setwd("./project")
unzip("UCI_HAR_Dataset.zip")https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## list all extracted files
list.files(recursive = TRUE)

## read delimited text files and store as objects
setwd("./UCI HAR Dataset")
features<-read.table("features.txt",col.names=c('V1','features'))
xtest<-read.table("test/X_test.txt",col.names=features$features)
ytest<-read.table("test/y_test.txt",col.names='activity')
subject_test<-read.table("test/subject_test.txt",col.names = "subject")
xtrain<-read.table("train/X_train.txt",col.names=features$features)
ytrain<-read.table("train/y_train.txt",col.names='activity')
subject_train<-read.table("train/subject_train.txt",col.names = "subject")
activityLabels<-read.table("activity_labels.txt")

## create single table with test measurements, test subjects & test activities
testData<-cbind(subject_test,ytest,xtest)
trainData<-cbind(subject_train,ytrain,xtrain)

## create single dataset of training and test data
allData<-rbind(trainData,testData)

##create a tidy data set with just the mean and standard deviation measuremnets
if(!"dplyr" %in% installed.packages()){install.packages("dplyr")}
library(dplyr)
Tidy_Data<-select(allData,subject,activity,contains("mean"),contains("std"))

##group data by subject and activity
Tidy_Data<-group_by(Tidy_Data,subject,activity)

##give decriptive names for activities and measurements
Tidy_Data$activity<-activityLabels[Tidy_Data$activity,2]
names(Tidy_Data)<-gsub("Acc","accelerometer",names(Tidy_Data))
names(Tidy_Data)<-gsub("Gyro","gyroscope",names(Tidy_Data))
names(Tidy_Data)<-gsub("Mag","Magnitude",names(Tidy_Data))
names(Tidy_Data)<-gsub("freq","frequency",names(Tidy_Data))
names(Tidy_Data)<-gsub("^f","frequency",names(Tidy_Data))
names(Tidy_Data)<-gsub("^t","time",names(Tidy_Data))


## create a separate data set of averages of all mesurements for each subject
##each activity
summarise_all(Tidy_Data,list(mean=mean))

##write the tidy data set to a table
write.table(Tidy_Data,"Tidy_Data.txt")


