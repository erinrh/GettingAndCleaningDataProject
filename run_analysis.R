# using packages
library(dplyr)

# reading data
activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")

subjecttest <- read.table("UCI HAR Dataset/test/subject_test.txt")
labelstest <- read.table("UCI HAR Dataset/test/y_test.txt")
datatest <- read.table("UCI HAR Dataset/test/X_test.txt")

subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
labelstrain <- read.table("UCI HAR Dataset/train/y_train.txt")
datatrain <- read.table("UCI HAR Dataset/train/X_train.txt")

# extract only mean and std columns
featuresmeanandstd <- grep("std\\(\\)|mean\\(\\)",features$V2)
datatest <- datatest[,featuresmeanandstd]
datatrain <- datatrain[,featuresmeanandstd]

#Setting column names
columnNames <- sub("\\(\\)", "", features$V2[featuresmeanandstd]) 
columnNames <- gsub("-", "_", columnNames) 
names(datatest) <- columnNames
names(datatrain) <- columnNames

#adding subjects and labels
datatest <- cbind(subject = subjecttest$V1,datatest)
datatest <- cbind(label = labelstest$V1,datatest)
datatrain <- cbind(subject =subjecttrain$V1,datatrain)
datatrain <- cbind(label =labelstrain$V1,datatrain)

# combine test and training data sets
dataall <- rbind(datatest,datatrain)

# adding activity labels
dataall <- merge(activitylabels, dataall, by.x = "V1", by.y = "label")
names(dataall)[1:2] <- c("activityid","activity")

# calculating averages
dataall <- group_by(dataall, activityid, activity, subject)
averages <- summarize_all(dataall, funs(mean))
names(averages)[4:69] <- paste(names(averages)[4:69],"_average", sep = "")


