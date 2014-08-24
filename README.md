## GetData_CourseProject
##### The repository for the course project of getting and cleaning data on Coursera
=====================
In order to make sure that my code works fine, please put the data folder "UCI HAR Dataset" into your working directory before running my code.

My code does such jobs sequentially:
* Read the train and test data
* Merge the training and test sets
* Extract the measurements on the mean and standard deviation for each measurement
* Use descriptive activity names to name the activities in the data set
* Label the data set with descriptive variable names
* Creates a tidy data set with the average of each variable for each activity and each subject
* Output the tidy data set

The results will be written in a txt file named "final_data_set.txt" automatically, with numbers seperated by "\t".