#This is the R script to do the jobs as requested.
#Before starting to deal with the data, please put the data folder "UCI HAR Dataset"
#into your working directory.

#Read the training and testing data
colnames <- read.table("UCI HAR Dataset/features.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt",col.names = colnames[,2])
y_train <- read.table("UCI HAR Dataset/train/y_train.txt",col.names = "activity")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt",col.names = colnames[,2])
y_test <- read.table("UCI HAR Dataset/test/y_test.txt",col.names = "activity")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt",col.names = "subject")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt",col.names = "subject")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

#Merge the training and testing sets
train_set <- cbind(x_train, y_train, subject_train)
test_set <- cbind(x_test, y_test, subject_test)
total_set <- rbind(train_set, test_set)

#Extract the measurements on the mean and standard deviation for each measurement
a <- vector(mode = "numeric")
a <- append(a, grep("mean()",colnames[,2],fixed=TRUE))
a <- append(a, grep("std()",colnames[,2],fixed=TRUE))
a <- append(a, 562)
a <- append(a, 563)
total_set <- total_set[,sort(a)]

#Use descriptive activity names to name the activities in the data set
total_set$activity <- activity_labels[total_set$activity, 2]

#Label the data set with descriptive variable names
#Here, I will return to the original style of the variable names, such as fBodyAcc-
#std()-X, because I think they are the most descriptive.
names(total_set) <- gsub("\\.\\.","()",names(total_set))
names(total_set) <- gsub("\\.","-",names(total_set))

#Creates a tidy data set with the average of each variable for each activity and 
#each subject
final_set <- aggregate(total_set[,1:66], list(total_set$activity, total_set$subject), mean)
names(final_set) <- gsub("Group.1","Activity",names(final_set))
names(final_set) <- gsub("Group.2","Subject",names(final_set))

#Output the tidy data set
write.table(final_set, "final_data_set.txt", row.names = FALSE, sep = "\t")