## Getting and cleaning assignment 1

The code downloads and loads the data and cleans it.

It outputs 2 files, one is the tidy data set named **output_final.txt** and 
another tidy data set containing mean of each activity for each subject named **output_means.txt**

According to the question, the assignment was split into 5 parts(or sub questions)

## Part 1 

1. Loading test and training datas(X_train.txt),(X_test.txt), loading the subject details
given by subject_train.txt and subject_test.txt, and training and test set labels(y_test and y_train).(3,4,5,8,9,10 lines)

2. Adding the labels and subject details to the corresponding data sets(6,7,11,12 lines)

3. Merging the Data sets (training and test sets) to form a new set given by finalDat(line 13)

## Part 2 and 3

1. To subset the variables from the dataset, first the features set (features.txt) was loaded.(14,15 lines)

2. Next, regular expressions were used to figure out the column indices which contained mean and standard deviation
calculations(given by mean() and std()).(16,17 lines)

3. These indices were used to subset from the finalDat set and the feature set so the final data now contains only mean
and std mesuring variables.(18,19 lines)

4. Next, to name the columns of the data, the resultant feature set after subsetting was used(line 20).

## Part 4

For this part, activity labels file was loaded which contained the names of the acivities and it was used as the
levels of the activity column of the data set (lines 22 and 23)

## Part 5

1. for finding the mean subject and activity wise, first the frame was split on basis of subject and activities(line 25)

2. Column means of the respective columns(except 67 and 68) were found and then coerced with subject and acitvity(line 26)
Due to the coercion, numerics were changed into characters which is rectified later

3. Then using **do.call("rbind",list)**, the list was corced into matrix and then converted to a data frame(lines 26 and 27)

4. Then finally the columns of the data frame, which were changed into characters during coercion were changed back to numeric.(the for loop lines 29 to 31 ) 
