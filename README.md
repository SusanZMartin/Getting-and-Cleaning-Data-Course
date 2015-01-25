# News flash!

As a good Coursera fellow student I want to make life as easy as possible for those who might be assessing my work - so before I launch into the rather dry material about the Course Project here are instructions on how to download the tidy data file. 

## How to read the tidy data file

To read in the tidy data file I have uploaded (called HARTidyData) from the peer assessment page so that you can visually inspect it to confirm that it is indeed 'tidy', do the following (1):

* right click on the file name shown (HARTidyData) in the first window of the peer assessment page to download it to your computer (apologies that these instructions are rather 'Windows-centric' - I'm confident that if you are using a Mac or other OS you'll be able to figure it out!)
* name the file with whatever file name you prefer - don't forget to give it a .txt extension if your system does not recognize it as a text file and append that extension automatically
* save the file into your R or RStudio working directory
* from the working directory enter and run the code below to read the file into a data frame and view it   
   `data <- read.table("yourfilename.txt", header=TRUE)`  
   `View(data)`
   
We now return you to our regularly scheduled Course Project documentation.

# Course Project

There are four deliverables for the Course Project in the Getting and Cleaning Data Course offered by Coursera from January 5, 2015 to February 2, 2015, the first three of which are found in this repository (https://github.com/SusanZMartin/Getting-and-Cleaning-Data-Course/tree/Course-Project-January-2015):  
* README.md document (which you are currently reading)  
* Codebook.md document  
* the run_analysis.R script that produces the final tidy data set  
* the HARTidyData.txt file which is a text version of the tidy data set and has been uploaded to Coursera for peer assessment  

## Conditions Required for Successful Execution of run_analysis.R

To successfully reproduce an EXACT copy of the tidy data set from your computer by running the run_analysis.R script contained in this repository the following conditions must be met:  
* you must replicate the environment under which the script was run (clear your environment by running `rm(list=ls())`, install the dplyr package if it is not installed and ensure that you are using R Version 3.1.2 (nickname 'Pumpkin Helmet') or later)    
* you must download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip   
* the top level of the data (which will default to a folder named 'UCI HAR Dataset' when you extract the files) must be your working directory and the files and directory structure of the downloaded data must be as specified below   
* the features.txt file must be modified as described in the Codebook (https://github.com/SusanZMartin/Getting-and-Cleaning-Data-Course/blob/Course-Project-January-2015/Codebook.md) to remove 'illegal' characters from the variable names that prevent certain dplyr functions from executing properly (there are also some cosmetic changes made to repair variable names that seem to be incorrect but do not actual prevent any functions from working)   

### Files and Directory Structure of the Downloaded Data 

The working directory, as mentioned above, must be where the two files that contain information that pertain to both the TRAIN and the TEST data reside. This directory (or folder) will default to UCI HAR Dataset if you simply extract the files without specifying any parameters. These two files are called:  
* features.txt (561 rows each of which contains an integer followed by a string that indicates the name of the variable that corresponds to that column in the X_train and X_test datafiles - this file must be modified as described in the Codebook)  
* activity_labels.txt (6 rows each of which contains an integer followed by a string that indicates which of 6 activities is represented by the corresponding integer)  
 
There are two child directories (or folders) within the UCI HAR Dataset directory called test and train. These directories each contain 3 files that are required for the script to run successfully and the directory names 'test' and 'train' must be preserved (without the quotes). The files in each directory are:  
* subject_test.txt/subject_train.txt  (2947/7352 rows each of which contains an integer representing one of the 30 subjects in the study - the subject_test file has 9 unique integers while the subject_train file has 21 unique integers)  
* X_test.txt/X_train.txt  (2947/7352 rows each of which contains 561 values that correspond to a computed 'feature vector' for a unique observation of a specific subject performing a specific activity at a specific time point)  
* y_test.txt/y_train.txt  (2947/7352 rows each of which contains contains an integer that corresponds to the activity being performed by the subject for that observation)  

## Composition of the tidy data file

The tidy data file differs from the entire dataset in that:  
* each row contains the mean of a variable that was measured for a subject while performing that activity (thus the tidy data file has 180 rows - 30 subjects each of which performed 6 activities)  
* there are not 561 measurements for each subject:activity combination but rather 66 which were selected based on the instruction for the assignment which was to extract "only the measurements on the mean and standard deviation for each measurement" (2,p1) (for more information on the rationale used to select these variables see the Codebook)

The tidy data set has the dimensions of 180 rows by 68 columns (66 variables plus the Subject and Activity columns). Note that the tidy data set produced by my run_analysis.R script is named FinalTidy.

## References

Note that those references that refer to forum postings are only accessible to those that are enrolled in the Getting and Cleaning Data course running January 5, 2015 to February 2, 2015. References use Vancouver style which puts a number in brackets in the text to indicate a citation and arranges the reference list by ascending numerical order by citation number.

1. Hood D. David's Project FAQ. In: Getting and Cleaning Data/Forums/Course Project [Internet] Coursera; 2015 Jan 6           [cited 2015 Jan 25]. [Original post ~86 lines]. Retrieved from https://class.coursera.org/getdata-010/forum/thread?thread_id=49
2. Leek J. Peer Assessments/Getting and Cleaning Data Course Project. In: Getting and Cleaning Data/Course Project [Internet] Coursera; 2015 Jan 6 [cited 2015 Jan 25]. Retrieved from https://class.coursera.org/getdata-010/human_grading/view/courses/973497/assessments/3/submissions


