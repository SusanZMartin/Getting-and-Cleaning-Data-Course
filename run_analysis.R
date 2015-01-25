## I have modified the features.txt file so that it no longer has hyphens and
## brackets or commas - also replaced BodyBody with Body will now try this 
## - need to capture these changes in Codebook entire routine with this change



## The script that follows
## 1. Merges the training and the test sets to create one data set. 
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.  
## 3. Uses descriptive activity names to name the activities in the data set 
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject.

##  First I want to read in each of the files into a data frame and then into a dataframe
##  table - this involves 8 text files, 3 in the train folder, 3 in the test folder
##  and two in the parent folder above. The 3 files in each folder are X_<train/test>
##  which contains the measurements of 561 variables, y_<train/test> which contains
##  a single column of numbers 1 through 6 which represents different activities and
##  subject_<train/test> which is a single column of numbers 1 through 30 (9 numbers in
##  test, 21 numbers in train) which represents the ID of the different subjects. The
##  features.txt file contains 561 strings which are the column headings for the variables
##  contained in x_<train/test>. The activity_labels.txt file contains 6 strings which
##  contain the names of the 6 activities represented by numbers in y_<train/test>.

## My 8 names for data frames are going to be labels, features, Xtrain, Xtest, 
## Ytrain, Ytest, TrainSub, TestSub

## so for each of 8 files I will do dfname <- read.table(filename), followed by 
## <labelname> <- tbl_df(dfname)

## note the stringsAsFactors = FALSE in the first two so that the column headings
## come across as strings rather than being interpreted as factors

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

## Looking at the data frame tables created I see that the 'train' data contains
## 7,352 rows (21 subjects - 1,3,5,6,7,8,11,14,15,16,17,19,21,22,23,25,26,27,28,29,30)
## and the 'test' data contains 2,947 rows (9 subjects - 2,4,9,10,12,13,18,20,24)


## Now I want to put the activity names into the Ytrain and Ytest rather than
## having the numbers - this is not a particularly elegant solution but it works


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

## finally label the V1 column of Ytrain and Ytest as Activity and
## the V1 column of TrainSub and TestSub as Subject

names(Ytrain)[1] <- "Activity"
names(Ytest)[1] <- "Activity"

names(TrainSub)[1] <- "Subject"
names(TestSub)[1] <- "Subject"

## now lets create two data frame tables TRAIN and TEST by cbinding
## the 3 data frames (TrainSub,Ytrain,Xtrain and TestSub,Ytest,Xtest)
## together in this order and then convert to a data frame table

TRAIN <- cbind(TrainSub,Ytrain,Xtrain)
TRAIN <- tbl_df(TRAIN)

TEST <- cbind(TestSub,Ytest,Xtest)
TEST <- tbl_df(TEST)

## now rbind to put them together and again convert to a data frame table
## this new data frame table will be called MergedData - it has 563 columns
## and 10,299 rows

MergedData <- rbind(TRAIN,TEST)
MergedData <- tbl_df(MergedData)

## use the renaming method to create one complete data set

## Now I am going to put the variable names from features as column headings on
## Xtrain and Xtest using for names(<dft name)[i] <- as.character(features[i,2])
## i will do this in a loop once I verify it works

AllVariablesData <- MergedData

for (i in 1:561) {names(AllVariablesData)[i + 2] <- as.character(features[i,2])}


## earlier methods to extract the columns after they had been renamed was causing problems
## so I will extract them using the script below and THEN rename them

## the actions above are causing problems so I will try to rename the columns in the 
## MergedData set AFTER the columns are selected out when they still have default
## variable names

featuresMean <- features[grep("mean__", features$V2),]
featuresStd <- features[grep("std_", features$V2),]

#put these two together using rbind and then arrange in order
#use this usetoselect[,1] to select columns from MergedData

usetoselect <- rbind(featuresMean,featuresStd)
usetoselect <- arrange(usetoselect, V1)

## Do not forget that we have added two columns - Subject and Activity - to
## the data frame so the usetoselect numbers need to be offset by 2 (column 1
## becomes column 3, ...). We must also turn it into a vector for use in 
## the select process

extract <- usetoselect[,1]
offsetext <- mutate(extract, V2 = V1 +2)
extract <- offsetext[,2]
extract <- as.vector(t(extract))

## Finally use extract to created our new complete data set with only the Mean
## and Std() measurements extracted - do not forget to keep first two columns

FinalDataSet <- select(MergedData, 1:2,extract)

## Now we need to put the names at the top of the columns, we can use the renaming
## process developed earlier but use the usetoselect file with the column headings
## in the 2nd column and use the [i + 2] for the column to put the name on the top
## of each column (do this so that a copy remains in case it is needed)

TestFinalRenamed <- FinalDataSet

for (i in 1:86) {names(TestFinalRenamed)[i + 2] <- as.character(usetoselect[i,2])}

CompleteExtractedDataSet <- TestFinalRenamed

## Start in the morning of January 23, 2015 with figuring out how to create the
## tidy data set and tidying up this code



## also start putting together the codebook
## possible reference for body jerk http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3926561/
## david recommends looking at this codebook 
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 
## and also see his post in forums at 
## https://class.coursera.org/getdata-010/forum/thread?thread_id=49#comment-438
## also read the Hadley Wickham document on tidy data

## arrange the data in subject number order

arrangeddata <- arrange(CompleteExtractedDataSet, Subject)

## create a test dataset which is grouped by Subject and Activity

testtidy <- group_by(arrangeddata, Subject, Activity)

## here we can see that the process works when we summarise by a single variable

variable1 <- summarise(testtidy, mean(tBodyAcc.mean__.X))

## and here is how we do it for the whole dataset
## tomorrow - jan 23rd - concentrate on getting this exactly right
## and working on codebook and readme etc

FinalTidy <- summarise_each(testtidy, funs(mean))

## some extra functions that you might like to look at

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


