download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile = "dataset.zip")
unzip("dataset.zip")
trDat <- read.table("UCI HAR Dataset/train/X_train.txt") # loading the training set
trainLab  <- read.table("UCI HAR Dataset/train/y_train.txt") # loading the activity labels for training set
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt") # subject details for training set
trDat <- cbind(trDat,trainLab)
trDat <- cbind(trDat,subject_train) # binding the activity labels and subject details to the set
testDat <- read.table("UCI HAR Dataset/test/X_test.txt") # test set
testLab <- read.table("UCI HAR Dataset/test/y_test.txt") # test labels
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt") # test subject details
testDat <- cbind(testDat,testLab)
testDat <- cbind(testDat,subject_test)# binding the activity labels and subject details to the test set
finalDat <- rbind(trDat,testDat) #binding test and training sets to form the final set. 
# ----------------End of part 1------------------------
features <- read.table("UCI HAR Dataset/features.txt",stringsAsFactors = FALSE) # features set(data frame)
features <- features[,2] # features set(vector)
regex <- "mean\\(\\)|std\\(\\)" # regex matching mean or std. \\ is used as an escape sequence for ( or )
match <- grepl(regex,features) # match regex with grepl command for the features set
features<-features[match] #subsetting feature set
finalDat<-finalDat[,match] # subsetting data
# ----------------End of part 2-----------------------
names(finalDat) <- c(features,"labels","subject") # naming the columns. The extra 2 columns are named labels and subject
# ----------------End of part 3-----------------------
finalDat$"labels" <- as.factor(finalDat$"labels")
activities <- read.table("UCI HAR Dataset/activity_labels.txt",stringsAsFactors = FALSE) # reading activity labels
levels(finalDat$"labels") <- activities[,2] #naming the activity labels
write.table(finalDat,file = "output_final.txt",row.names = FALSE) # writing tidy data to out_final.txt
# ------------------End of part 4------------------------
list_data <- split(finalDat,list(finalDat$subject,finalDat$label),drop = TRUE) # splitting based on suject and activity
applied <- sapply(list_data,function(x) c(colMeans(x[,1:66]),subject = as.numeric(x$subject[1]),labels = as.character(x$labels[1])),simplify = FALSE) # Finding column wise mean and creating a vvector out of it. Numeric are coerced to character during process.
new_frame <- do.call("rbind",applied) # using do.call function to repeat rbind fuction to coerce list into matrix
df <- data.frame(new_frame,stringsAsFactors = FALSE) # creating data frame from the matrix
for(i in 1:67){ #For changing back columns to numeric vectors. Coerced to character during sapply stey
  df[,i] <- as.numeric(df[,i]) 
}
write.table(df,file = "output_means.txt", row.names = FALSE) # writing new data frame to output_means.txt
# -----------------End of part 5 and assignment-----------------
# For more details, please refer to readme