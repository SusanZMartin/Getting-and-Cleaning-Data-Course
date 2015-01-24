# Course Project

There are four deliverables for the Course Project in the Getting and Cleaning Data Course offered by Coursera from January 5, 2015 to February 2, 2015, the first three of which are found in this repository (https://github.com/SusanZMartin/Getting-and-Cleaning-Data-Course/tree/Course-Project-January-2015):  
1. a README.md document (which you are currently reading)
2. a Codebook.md document 
3. the run_analysis.R script that produces the final tidy data set
4. the HARTidyData.txt file which is a text version of the tidy data set and has been uploaded to Coursera for peer assessment

## Assumptions for Successful Execution of run_analysis.R

To successfully reproduce an EXACT copy of the tidy data set from your computer by running the run_analysis.R script the following conditions must be met:
1. you must replicate the environment under which the script was run (clear your environment by running `rm(list=ls())`, install the dplyr package if it is not installed and ensure that you are using R Version 3.1.2 (nickname 'Pumpkin Helmet') or later
2. you must download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. the top level of the data (which will default to a folder named 'UCI HAR Dataset' when you extract the files) must be your working directory and contain the files specified below
3. the features.txt file must be modified as described in the Codebook ( ) to remove 'illegal' characters from the variable names

 


## How to read the tidy data file

To open the tidy data file I have uploaded (called HARTidyData) from the peer assessment page so that you can visually inspect it to confirm that it is indeed 'tidy', do the following:

* right click on the file name shown (HARTidyData) in the first window of the peer assessment page to download it to your computer (apologies that these instructions are rather 'Windows-centric' - I'm confident that if you are using a Mac or other OS you'll be able to figure it out!)
* name the file with whatever file name you prefer - don't forget to give it a .txt extension if your system does not recognize it as a text file and append that extension automatically
* save the file into your R or RStudio working directory
* from the working directory enter and run the code below to read the file into a data frame and view it   
   `data <- read.table("yourfilename.txt", header=TRUE)`  
   `View(data)`
   
