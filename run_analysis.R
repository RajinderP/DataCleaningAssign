#load libraries
library(dplyr)
library(plyr)
#define where data is stored
homedir<-"C:\\Users\\bhutta\\Desktop\\Coursera\\DataCleaning\\ass\\UCI HAR Dataset"
setwd(homedir)

#read information applicable to both data sets, train and test
features<- read.csv("features.txt", sep="", header=F)
features_head<-features[,2]
activities<-read.csv("activity_labels.txt",sep="",header=F, col.names=c("Act_num","Act_name"))

#get the columns which are mean or standard deviation so we extract only these from data using colClasses
allvar<-c(grep("*mean",features_head) ,grep("*std",features_head))
allvartype<-c(rep("NULL",length(features_head)))
allvartype[allvar]= NA
  
#read information for test set data
testdir<-paste(homedir,"\\test", sep="")
setwd(testdir)
subject_test<-read.csv("subject_test.txt", sep="", header=F, col.names="Sub_num")
x_test<-read.csv("X_test.txt",sep="",header=F, col.names=features_head, colClasses=allvartype)
y_test<-read.csv("y_test.txt",sep="",header=F,col.names=c("Act_num"))

#bind with other relevant test information - subject and activity
test_df<-cbind(x_test,subject_test,y_test)

#read information for train set data and bind with other relevant information - subject and activity
traindir<-paste(homedir,"\\train", sep="")
setwd(traindir)
subject_train<-read.csv("subject_train.txt", sep="", header=F, col.names="Sub_num")
x_train<-read.csv("X_train.txt",sep="",header=F, col.names=features_head, colClasses=allvartype)
y_train<-read.csv("y_train.txt",sep="",header=F, col.names=c("Act_num"))

#bind with other relevant train information - subject and activity
train_df<-cbind(x_train,subject_train,y_train)

#merge train and test data and add description for activities from activity_labels.txt, and remove activity number
all_df<-merge(rbind(test_df, train_df),activities)
all_df[1]<-NULL

#use more descriptive names
names(all_df) <- gsub("^t", "Time", names(all_df))
names(all_df) <- gsub("^f", "Freq", names(all_df))
names(all_df) <- gsub("BodyBody", "Body", names(all_df))
names(all_df) <- gsub("Mag", "Magnitude", names(all_df))
names(all_df) <- gsub("mean", "Mean", names(all_df))
names(all_df) <- gsub("std", "StDev", names(all_df))

#Calculate averages over each subject and activity for each numeric column
ave_df<- ddply(all_df, c("Sub_num","Act_name"), numcolwise(mean))

#write both files out
setwd(homedir)
write.table(all_df,"Tidy_data.txt")
write.table(ave_df,"Average_data.txt")

