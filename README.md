# Course Project

The Course Project in the Getting and Cleaning Data Course offered by Coursera from January 5, 2015 to February 2, 2015, is comprised of four parts, the first three of which are found in this repository (https://github.com/SusanZMartin/Getting-and-Cleaning-Data-Course/tree/Course-Project-January-2015):
1 this README.md document which you are reading currently
2 a Codebook.md document 
3 the run_analysis.R script that produces the final tidy data set
4 the HARTidyData.txt file which is a text version of the tidy data set and has been uploaded to Coursera for peer assessment

## Assumptions for Successful Execution of run_analysis.R

working directory, packages, version of R, modifications to features.txt

## How to read the tidy data file

To open the tidy data file I have uploaded (called HARTidyData) from the peer assessment page so that you can visually inspect it to confirm that it is indeed 'tidy', do the following:

* right click on the file name shown (HARTidyData) in the first window of the peer assessment page to download it to your computer (apologies that these instructions are rather 'Windows-centric' - I'm confident that if you are using a Mac or other OS you'll be able to figure it out!)
* name the file with whatever file name you prefer - don't forget to give it a .txt extension if your system does not recognize it as a text file and append that extension automatically
* save the file into your R or RStudio working directory
* from the working directory enter and run the code below to read the file into a data frame and view it   
   `data <- read.table("yourfilename.txt", header=TRUE)`  
   `View(data)`
   
