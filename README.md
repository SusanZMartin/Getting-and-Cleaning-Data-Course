# Course Project

## Components Of This Assignment

## Assumptions for Successful Execution of run_analysis.R

working directory, packages, version of R, modifications to features.txt

## How to read the tidy data file

To open the tidy data file I have uploaded (called HARTidyData) from the peer assessment page so that you can visually inspect it to confirm that it is indeed 'tidy', do the following:

-right click on the file name shown (HARTidyData) in the first window of the peer assessment page to download it to your computer (apologies that these instructions are rather 'Windows-centric' - I'm confident that if you are using a Mac or other OS you'll be able to figure it out!)
-name the file with whatever file name you prefer - don't forget to give it a .txt extension if your system does not recognize it as a text file and append that extension automatically
-save the file into your R or RStudio working directory
-use the code below to read the file successfully into a data frame and view it
    data <- read.table("yourfilename.txt", header=TRUE)
    View(data)
   
