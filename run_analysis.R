## To learn more about conditions required to reproduce the tidy data set that is
## the end product of this script please see the README.md and Codebook.md documents at
## https://github.com/SusanZMartin/Getting-and-Cleaning-Data-Course/tree/Course-Project-January-2015/

## The script that follows:
## *Merges the training and the test sets to create one data set. 
## *Extracts only the measurements on the mean and standard deviation for each measurement.  
## *Uses descriptive activity names to name the activities in the data set 
## *Appropriately labels the data set with descriptive variable names.
## *From the data set in the previous step, creates a second, independent tidy data set 
##  with the average of each variable for each activity and each subject.

## Loads the dplyr package and reads all the needed text files into data frame tables
## use the argument stringsAsFactors = FALSE to avoid any text values being interpreted as factors

library(dplyr)

features <- read.table("features.txt", stringsAsFactors = FALSE)
features <- tbl_df(features)
labels <- read.table("activity_labels.txt" , stringsAsFactors = FALSE)
labels <- tbl_df(labels)

Xtrain <- read.table("train/X_train.txt")
Xtrain <- tbl_df(Xtrain)
Ytrain <- read.table("train/y_train.txt")
Ytrain <- tbl_df(Ytrain)
TrainSub <- read.table("train/subject_train.txt", stringsAsFactors = FALSE)
TrainSub <- tbl_df(TrainSub)

Xtest <- read.table("test/X_test.txt")
Xtest <- tbl_df(Xtest)
Ytest <- read.table("test/y_test.txt")
Ytest <- tbl_df(Ytest)
TestSub <- read.table("test/subject_test.txt", stringsAsFactors = FALSE)
TestSub <- tbl_df(TestSub)


## *Uses descriptive activity names to name the activities in the data set 
## The following code replaces integers 1:6 in the data frame table with the corresponding
## activity - this is not a particularly elegant solution but it works

for (i in 1:2947){
      
      
      if (Ytest[i,1] == 1) { Ytest[i,1] <- paste("WALKING")}
      if (Ytest[i,1] == 2) { Ytest[i,1] <- paste("WALKING_UPSTAIRS")}
      if (Ytest[i,1] == 3) { Ytest[i,1] <- paste("WALKING_DOWNSTAIRS")}
      if (Ytest[i,1] == 4) { Ytest[i,1] <- paste("SITTING")}
      if (Ytest[i,1] == 5) { Ytest[i,1] <- paste("STANDING")}
      if (Ytest[i,1] == 6) { Ytest[i,1] <- paste("LAYING")}

}

for (i in 1:7352){
      
      
      if (Ytrain[i,1] == 1) { Ytrain[i,1] <- paste("WALKING")}
      if (Ytrain[i,1] == 2) { Ytrain[i,1] <- paste("WALKING_UPSTAIRS")}
      if (Ytrain[i,1] == 3) { Ytrain[i,1] <- paste("WALKING_DOWNSTAIRS")}
      if (Ytrain[i,1] == 4) { Ytrain[i,1] <- paste("SITTING")}
      if (Ytrain[i,1] == 5) { Ytrain[i,1] <- paste("STANDING")}
      if (Ytrain[i,1] == 6) { Ytrain[i,1] <- paste("LAYING")}
      
      
      
}

## *Appropriately labels the data set with descriptive variable names.
## The code directly below replaces the default column heading names of
## column 1 in the Ytrain, Ytest, TrainSub and TestSub data frame tables
## with appropriate names

names(Ytrain)[1] <- "Activity"
names(Ytest)[1] <- "Activity"

names(TrainSub)[1] <- "Subject"
names(TestSub)[1] <- "Subject"

## *Merges the training and the test sets to create one data set. 
## I created the merged data set in two steps, first by cbinding three data frame
## tables together (TrainSub,Ytrain,Xtrain and TestSub,Ytest,Xtest) to create two 
## data frame tables TRAIN and TEST


TRAIN <- cbind(TrainSub,Ytrain,Xtrain)
TRAIN <- tbl_df(TRAIN)

TEST <- cbind(TestSub,Ytest,Xtest)
TEST <- tbl_df(TEST)

## *Merges the training and the test sets to create one data set. 
## In the second step I used rbind to put together TRAIN and TEST into a
## new data frame table called MergedData (10299, 563)

MergedData <- rbind(TRAIN,TEST)
MergedData <- tbl_df(MergedData)

## *Appropriately labels the data set with descriptive variable names.
## The code below replaces default column headings with the actual variable names
## the offset of +2 is used because the Subject and Activity columns already are named

AllVariablesData <- MergedData

for (i in 1:561) {names(AllVariablesData)[i + 2] <- as.character(features[i,2])}


## *Extracts only the measurements on the mean and standard deviation for each measurement.  
## This process is accomplished in several steps - first I build a list of the columns headed
## by a variable name containing mean() [mean__ in modified features.txt file] or std()
## [std__ in modified features.txt file]. To learn more about the changes made to the features.txt
## file as well as rationale behind which variables were chosen for extraction see the README.md and/or Codebook at 
## https://github.com/SusanZMartin/Getting-and-Cleaning-Data-Course/tree/Course-Project-January-2015/

featuresMean <- features[grep("mean__", features$V2),]
featuresStd <- features[grep("std_", features$V2),]

## I then rbind these two separate data frame tables together to form one 

usetoselect <- rbind(featuresMean,featuresStd)
usetoselect <- arrange(usetoselect, V1)

## I turn this data frame table into a vector which contains the column numbers
## to be extracted from the MergedData set (which still has default column
## headings except for Subject and Activity) - again an offset of +2 is used
## since columns one and two already exist

extract <- usetoselect[,1]
offsetext <- mutate(extract, V2 = V1 +2)
extract <- offsetext[,2]
extract <- as.vector(t(extract))

## Finally use extract to create a new complete data set with only the Mean
## and Std() measurements extracted - do not forget to keep first two columns

FinalDataSet <- select(MergedData, 1:2,extract)

## *Appropriately labels the data set with descriptive variable names.
## Now we need to put the names at the top of the extracted columns, we can use the renaming
## process developed earlier but use the usetoselect file with the column headings
## in the 2nd column and use the [i + 2] for the column to put the name on the top
## of each column (create a copy so have something to revert to in case of errors)

TestFinalRenamed <- FinalDataSet

z <- nrow(usetoselect)

for (i in 1:z) {names(TestFinalRenamed)[i + 2] <- as.character(usetoselect[i,2])}

CompleteExtractedDataSet <- TestFinalRenamed

## *From the data set in the previous step, creates a second, independent tidy data set 
##  with the average of each variable for each activity and each subject.

## First I arranged the data by Subject in ascending order and created a copy (testtidy)
## to experiment with in case of errors

arrangeddata <- arrange(CompleteExtractedDataSet, Subject)

## create a test dataset which is grouped by Subject and Activity

testtidy <- group_by(arrangeddata, Subject, Activity)

## here we can see that the process works when we summarise by a single variable

variable1 <- summarise(testtidy, mean(tBodyAcc.mean__.X))

## *From the data set in the previous step, creates a second, independent tidy data set 
##  with the average of each variable for each activity and each subject.
## The single line of code below creates a tidy data set where each row contains a single
## observation of the mean of the extracted variables for each subject and activity 
## combination. FinalTidy has 180 rows (30 subjects X 6 activities) and 68 columns 
## (Subject, Activity and 66 numeric variables)

FinalTidy <- summarise_each(testtidy, funs(mean))

## Here is some additional code that can be run if you wish to see some more information about
## the number of observations per subject and per activity for each subject

# subjact <- group_by(arrangeddata, Subject, Activity)
# actpersubj <- summarise(subjact, count = n())
# actpersubj <- arrange(actpersubj, count)
# View(actpersubj)
# range(actpersubj$count)
# mean(actpersubj$count)
# 
# grpsubj <- group_by(arrangeddata, Subject)
# obspersubj <- summarise(grpsubj, count=n())
# obspersubj <- arrange(obspersubj, count)
# View(obspersubj)
# range(obspersubj$count)
# mean(obspersubj$count)
# 


