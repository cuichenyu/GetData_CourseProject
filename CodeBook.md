Variable Index: 1
Variable Name: Activity
Variable Type: string
Variable Explanation: The type of activity
Value: "LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", "WORKING_UPSTAIRS", each observation takes one of six values

Variable Index: 2
Variable Name: Subject
Variable Type: numeric
Variable Explanation: The number of the subject
Value: 1~30, each indicates an independent subject

Variable Index: 3~70
Variable Name: Follow the format of "A-B" or "A-B-C", in which A stands for the name of the signal, B indicates the type of calculation that has been carried out on the signal(either "mean" or "std"), and C is the direction of the signal(one letter in "X","Y" or "Z").
Variable Type: numeric
Variable Explanation: For example, the value of "tBodyAcc-mean()-X" in line 1 indicates the average number of Subject 1's tBodyAcc mean signal on direction X on tha activity laying