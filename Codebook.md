# Codebook

This Codebook is one of the four deliverables required for the Course Project in the Coursera Getting and Cleaning Data Course running January 5, 2015 to February 2, 2015. This repository's (https://github.com/SusanZMartin/Getting-and-Cleaning-Data-Course/Course-Project-January-2015) README.md file will give you more information on the other deliverables.

## Introduction

This Codebook aims to provide "information on the structure, contents,and layout of a data file" (1,p1) but also offers some information on how the data was originally collected, processed and about the data quality. In addition, the paragraphs below give a very brief overview of the area of Human Activity Recognition (HAR) research. This is provided in case the reader is interested and is in no way required for an understanding of the Course Project and its deliverables.

### Human Activity Recognition (HAR) Research

Since the 1980s, researchers have been working on learning how to 'recognize' human activities from various kinds of data. When we (humans) consider this we fail to see why this should be so challenging - if you show even a normally-abled (in terms of speech, intelligence and visual ability) 5-year-old child a video clip of a person walking and ask them if the person was 'sitting' or 'walking' you are almost 100% likely to get the right answer unless the child is intentionally misleading you. But if a computer is presented with the same data - a video clip - or even sensor data produced by single/multiple sensors on a subject's body collected with high frequency over repeated periods of activity (walking, jogging) the computer will need to 'learn' how to recognize an activity and distinguish it from the pattern produced by other activities.(2)

Since research began the cost and complexity of obtaining data has decreased - as is demonstrated by the study which produced the data set used as the basis for this Course Project. (3) The raw data for this study was obtained using 'off-the-shelf' consumer cellphones which for half of the measurements were attached to the body of the subject (at the waist) by the subjects themselves. (4) Although of course this is only a single study it has interesting implications for the future in terms of the user-friendliness and reduced expense of data collection.  

But why would anyone want to 'teach' a computer to do what a human can do so easily? It turns out that being able to automate the recognition of human activities can be valuable in a number of fields including health care. Recently I attended a lecture by Dr. Jeffrey Kaye, Director of the Oregon Centre for Aging and Technology (ORCATECH). ORCATECH is heavily involved in numerous projects that use a variety of methods to gather data on individuals during their activities of daily life - everything from sleep patterns to walking speed to heart rate. (5) They have been able to demonstrate via their research that a change in an activity - in this example a decrease in walking speed - may be associated with changes in cognitive function. (6) HAR can also be used simply to improve our ability to safeguard the elderly or anyone with mobility challenges by using computers to analyze data about their in-home activities rather than needing to visually and/or physically check in on them. Finally it must be mentioned that although HAR has many benign or even beneficial applications it can also be used for surveillance that could possibly infringe on personal liberties and privacy. (7)

## Sample and Data Collection Methods

The researchers recruited 30 volunteers aged between 19 and 48 for this study. No mention is made of the gender of volunteers or the ages of individual volunteers within the sample nor was there any mention of the health status (which could potentially be important to the measurements created when walking). Activities were "performed in laboratory conditions but volunteers were asked to perform freely the sequence of activities for a more naturalistic dataset".(4, p438) Each subject performed each activity at least twice with a 5 second rest period between repetitions. (4) For the first repetition of each activity the researchers attached the Samsung Galaxy S II smartphone to the subject at waist level and on the second repetition the subject was allowed to place it anywhere at waist level that they desired. (4) Signals were obtained from the accelerometer and gyroscope in each phone at a rate of 50Hz. 

Twenty one of the subjects (70%) were arbitrarily chosen to be in the TRAIN sample which was used to 'train' the computer in recognizing human activities (these were subjects 1, 3, 5, 6, 7, 8, 11, 14, 15, 16, 17, 19, 21, 22, 23, 25, 26, 27, 28, 29, 30). The measurements obtained from the 9 subjects in the TEST sample (subjects 2, 4, 9, 10, 12, 13, 18 ,20, 24) were then examined by the computer and assigned an 'activity' based on what it had 'learned' examining the TRAIN sample's measurements. (4)

The number of observations for each subject ranged from a low of 281 to a high of 409 (that is for all 6 activities) with a mean of 343. Number of observations for each activity ranged from a low of 36 to a high of 95 (across all 6 activities) with a mean of 57. More information on the number of observations per subject and number of observations per activity per subject can be found by uncommenting and running lines XX-XX at the end of the run_analysis.R script.

## Data Processing

The raw data obtained from the phone sensors were filtered to remove noise. (4) The resulting signals were processed mathematically, split into separate components (i.e. acceleration signal split into "gravitational and body motion components" (4, p439)) and in some cases re-sampled to create 10 signals all of which had a time component and 7 of which had a frequency component (resulting in 17 signals in total). These 17 signals were then 'measured' using a variety of methods to create the majority of the 561 variables included in the original dataset. These methods included taking the signal's mean, its standard deviation and its min and max. (8) Of the measurement methods some were applied to all signal types while some were only applied to time domain signals and others to frequency domain signals. (8) 

## Data Quality

The actual data (measurements of the 561 variables, subject information, activity information) had no missing values. However the names assigned to the variables by the researchers (contained in the features.txt file) were problematic and required modifications outside of R before they could be used by functions within the dplyr package. Some cosmetic modifications were also made to variable names that had repeated words. Changes are detailed below in the section titled 'Modification to the Variable Names'.

## Variables

### Modification to the Variable Names

Once it became clear that certain functions in R would not work properly (or at all in some cases) with the variable names supplied it became necessary to modify them. The features.txt file was opened in a text editor and a copy was saved as oldfeatures.txt before any changes were made (for future reference). A global replace was then performed which did the following:  
* replaced '-' (hyphen - without the quotes) with a '.' (period - without the quotes)    
* replaced ',' (comma - without the quotes) with a '.' (period - without the quotes)  
* replaced '(' (open bracket - without the quotes) with a '_' (underscore - without the quotes)  
* replaced ')' (close bracket - without the quotes) with a '_' (underscore - without the quotes)  
* replaced 'BodyBody' (without the quotes) with 'Body' (without the quotes)

### Rationale for which Variables were Extracted

The list that follows does not contain all the variables that were contained in the original but rather the (much) smaller subset that remains in the tidy data set that is the final product of the run_analysis.R script. The instructions were open to interpretation but I decided that rather than extract any variable with a name containing mean or std I would instead extract only those that contained mean() or std() (mean__ and std__ after modification of the variable names described above). I chose these variables because they are explicitly described in the documentation as being the mean or the standard deviation measurements of the feature vectors. (3-4,8) 

### Variable List

__Variable Name__   
Type of Variable   
Range (if applicable)/Possible Values  
Brief description   

__Subject__  
Integer (unique)  
1:30  
The unique ID of the experimental subject  

__Activity__   
Character  
Possible Values: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS  
The six activities that subjects performed during the experiment.  

**tBodyAcc.mean__.X**     
Numeric  
-1:1*  
The mean of the time domain signal measuring acceleration due primarily to body motion along the X axis.**  

**tBodyAcc.mean__.Y**   
Numeric  
-1:1*   
The mean of the time domain signal measuring acceleration due primarily to body motion along the Y axis.**  

**tBodyAcc.mean__.Z**   
Numeric  
-1:1*  
The mean of the time domain signal measuring acceleration due primarily to body motion along the Z axis.**   
   
**tBodyAcc.std__.X**   
Numeric  
-1:1*  
The standard deviation of the time domain signal measuring acceleration due primarily to body motion along the X axis.** 

**tBodyAcc.std__.Y**   
Numeric  
-1:1*  
The standard deviation of the time domain signal measuring acceleration due primarily to body motion along the Y axis.**  

**tBodyAcc.std__.Z**   
Numeric  
-1:1*  
The standard deviation of the time domain signal measuring acceleration due primarily to body motion along the Z axis.**  

**tGravityAcc.mean__.X**   
Numeric  
-1:1*  
The mean of the time domain signal measuring acceleration due primarily to gravity along the X axis.**   

**tGravityAcc.mean__.Y**   
Numeric  
-1:1*  
The mean of the time domain signal measuring acceleration due primarily to gravity along the Y axis.**   

**tGravityAcc.mean__.Z**   
Numeric  
-1:1*  
The mean of the time domain signal measuring acceleration due primarily to gravity along the Z axis.**    

**tGravityAcc.std__.X**   
Numeric  
-1:1*  
The standard deviation of the time domain signal measuring acceleration due primarily to gravity along the X axis.**   

**tGravityAcc.std__.Y**   
Numeric  
-1:1*  
The standard deviation of the time domain signal measuring acceleration due primarily to gravity along the Y axis.**   

**tGravityAcc.std__.Z**   
Numeric  
-1:1*  
The standard deviation of the time domain signal measuring acceleration due primarily to gravity along the Z axis.**   

**tBodyAccJerk.mean__.X**   
Numeric  
-1:1*  
The mean of the time domain body acceleration Jerk signal along the X axis (derived in time from body linear acceleration and angular velocity).**   

**tBodyAccJerk.mean__.Y**   
Numeric  
-1:1*  
The mean of the time domain body acceleration Jerk signal along the Y axis (derived in time from body linear acceleration and angular velocity).**   

**tBodyAccJerk.mean__.Z**   
Numeric  
-1:1*  
The mean of the time domain body acceleration Jerk signal along the Z axis (derived in time from body linear acceleration and angular velocity).**   

**tBodyAccJerk.std__.X**   
Numeric  
-1:1*  
The standard deviation of the time domain body acceleration Jerk signal along the X axis (derived in time from body linear acceleration and angular velocity).**   

**tBodyAccJerk.std__.Y**   
Numeric  
-1:1*  
The standard deviation of the time domain body acceleration Jerk signal along the Y axis (derived in time from body linear acceleration and angular velocity).**   

**tBodyAccJerk.std__.Z**   
Numeric  
-1:1*  
The standard deviation of the time domain body acceleration Jerk signal along the Z axis (derived in time from body linear acceleration and angular velocity).**   

**tBodyGyro.mean__.X**   
Numeric  
-1:1*  
The mean of the time domain signal measuring the body's angular speed along the X axis.**   

**tBodyGyro.mean__.Y**  
Numeric  
-1:1*  
The mean of the time domain signal measuring the body's angular speed along the Y axis.**   

**tBodyGyro.mean__.Z**   
Numeric  
-1:1*  
The mean of the time domain signal measuring the body's angular speed along the Z axis.**   

**tBodyGyro.std__.X**   
Numeric  
-1:1*  
The standard deviation of the time domain signal measuring the body's angular speed along the X axis.**   

**tBodyGyro.std__.Y**   
Numeric  
-1:1*  
The standard deviation of the time domain signal measuring the body's angular speed along the Y axis.**   

**tBodyGyro.std__.Z**  
Numeric  
-1:1*  
The standard deviation of the time domain signal measuring the body's angular speed along the Z axis.**   

**tBodyGyroJerk.mean__.X**   
Numeric  
-1:1*  
The mean of the time domain body angular speed Jerk signal along the X axis (derived in time from body linear acceleration and angular velocity).**   

**tBodyGyroJerk.mean__.Y**  
Numeric  
-1:1*  
The mean of the time domain body angular speed Jerk signal along the Y axis (derived in time from body linear acceleration and angular velocity).**   

**tBodyGyroJerk.mean__.Z**   
Numeric  
-1:1*  
The mean of the time domain body angular speed Jerk signal along the Z axis (derived in time from body linear acceleration and angular velocity).**   

**tBodyGyroJerk.std__.X**   
Numeric  
-1:1*  
The standard deviation of the time domain body angular speed Jerk signal along the X axis (derived in time from body linear acceleration and angular velocity).**   

**tBodyGyroJerk.std__.Y**   
Numeric  
-1:1*  
The standard deviation of the time domain body angular speed Jerk signal along the Y axis (derived in time from body linear acceleration and angular velocity).**   

**tBodyGyroJerk.std__.Z**   
Numeric  
-1:1*  
The standard deviation of the time domain body angular speed Jerk signal along the Z axis (derived in time from body linear acceleration and angular velocity).**   

**tBodyAccMag.mean__**   
Numeric  
-1:1*  
The mean of the time domain signal measuring the magnitude of acceleration due primarily to body motion.**  

**tBodyAccMag.std__**   
Numeric  
-1:1*  
The standard deviation of the time domain signal measuring the magnitude of acceleration due primarily to body motion.**  

**tGravityAccMag.mean__**   
Numeric  
-1:1*  
The mean of the time domain signal measuring the magnitude of acceleration due primarily to gravity.**  

**tGravityAccMag.std__**   
Numeric  
-1:1*  
The standard deviation of the time domain signal measuring the magnitude of acceleration due primarily to gravity.**  

**tBodyAccJerkMag.mean__**   
Numeric  
-1:1*  
The mean of the time domain body acceleration Jerk magnitude signal (derived in time from body linear acceleration and angular velocity).**   

**tBodyAccJerkMag.std__**   
Numeric  
-1:1*  
The standard deviation of the time domain body acceleration Jerk magnitude signal (derived in time from body linear acceleration and angular velocity).**   

**tBodyGyroMag.mean__**   
Numeric  
-1:1*  
The mean of the time domain signal measuring the magnitude of the body's angular speed.**   

**tBodyGyroMag.std__**   
Numeric  
-1:1*  
The standard deviation of the time domain signal measuring the magnitude of the body's angular speed.**   

**tBodyGyroJerkMag.mean__**   
Numeric  
-1:1*  
The mean of the time domain angular speed Jerk magnitude signal (derived in time from body linear acceleration and angular velocity).**   

**tBodyGyroJerkMag.std__**   
Numeric  
-1:1*  
The standard deviation of the time domain angular speed Jerk magnitude signal (derived in time from body linear acceleration and angular velocity).**   

**fBodyAcc.mean__.X**   
Numeric  
-1:1* 
The mean of the frequency domain signal measuring acceleration due primarily to body motion along the X axis.**     

**fBodyAcc.mean__.Y**   
Numeric  
-1:1*  
The mean of the frequency domain signal measuring acceleration due primarily to body motion along the Y axis.**     

**fBodyAcc.mean__.Z**   
Numeric  
-1:1*  
The mean of the frequency domain signal measuring acceleration due primarily to body motion along the Z axis.**     

**fBodyAcc.std__.X**   
Numeric  
-1:1*  
The standard deviation of the frequency domain signal measuring acceleration due primarily to body motion along the X axis.**     

**fBodyAcc.std__.Y**   
Numeric  
-1:1*  
The standard deviation of the frequency domain signal measuring acceleration due primarily to body motion along the Y axis.**     

**fBodyAcc.std__.Z**   
Numeric  
-1:1*  
The standard deviation of the frequency domain signal measuring acceleration due primarily to body motion along the Z axis.**   

**fBodyAccJerk.mean__.X**   
Numeric  
-1:1*  
The mean of the frequency domain body acceleration Jerk signal along the X axis.**   

**fBodyAccJerk.mean__.Y**   
Numeric  
-1:1*  
The mean of the frequency domain body acceleration Jerk signal along the Y axis.**   

**fBodyAccJerk.mean__.Z**   
Numeric  
-1:1*  
The mean of the frequency domain body acceleration Jerk signal along the Z axis.**   

**fBodyAccJerk.std__.X**   
Numeric  
-1:1*  
The standard deviation of the frequency domain body acceleration Jerk signal along the X axis.**   

**fBodyAccJerk.std__.Y**   
Numeric  
-1:1*  
The standard deviation of the frequency domain body acceleration Jerk signal along the Y axis.**   

**fBodyAccJerk.std__.Z**   
Numeric  
-1:1*  
The standard deviation of the frequency domain body acceleration Jerk signal along the Z axis.**   

**fBodyGyro.mean__.X**   
Numeric  
-1:1*  
The mean of the frequency domain body angular speed signal along the X axis.**   

**fBodyGyro.mean__.Y**   
Numeric  
-1:1*  
The mean of the frequency domain body angular speed signal along the Y axis.**   

**fBodyGyro.mean__.Z**   
Numeric  
-1:1*  
The mean of the frequency domain body angular speed signal along the Z axis.**   

**fBodyGyro.std__.X**   
Numeric  
-1:1*  
The standard deviation of the frequency domain body angular speed signal along the X axis.**  

**fBodyGyro.std__.Y**   
Numeric  
-1:1*  
The standard deviation of the frequency domain body angular speed signal along the Y axis.**  

**fBodyGyro.std__.Z**   
Numeric  
-1:1*  
The standard deviation of the frequency domain body angular speed signal along the Z axis.**  

**fBodyAccMag.mean__**   
Numeric  
-1:1*  
The mean of the frequency domain signal measuring the magnitude of acceleration due primarily to body motion.** 

**fBodyAccMag.std__**   
Numeric  
-1:1*  
The standard deviation of the frequency domain signal measuring the magnitude of acceleration due primarily to body motion.** 

**fBodyAccJerkMag.mean__**   
Numeric  
-1:1*  
The mean of the frequency domain body acceleration Jerk magnitude signal (derived in time from body linear acceleration and angular velocity).** 

**fBodyAccJerkMag.std__**   
Numeric  
-1:1*  
The standard deviation of the frequency domain body aceleration Jerk magnitude signal (derived in time from body linear acceleration and angular velocity).** 

**fBodyGyroMag.mean__**   
Numeric  
-1:1*  
The mean of the frequency domain body angular speed magnitude signal.** 

**fBodyGyroMag.std__**  
Numeric  
-1:1*  
The standard deviation of the frequency domain body angular speed magnitude signal.** 

**fBodyGyroJerkMag.mean__**    
Numeric  
-1:1*  
The mean of the frequency domain body angular speed Jerk magnitude signal (derived in time from body linear acceleration and angular velocity).** 

**fBodyGyroJerkMag.std__**     
Numeric  
-1:1*  
The standard deviation of the frequency domain body angular speed Jerk magnitude signal (derived in time from body linear acceleration and angular velocity).** 


*"Features are normalized and bounded within [-1,1]". (9, p2)

**Three dimensional magnitude variables were produced using the Euclidean norm. Variables in the frequency domain (indicated by a lower case f as the first character in the variable name) were produced by applying a Fast Fourier Transform. My understanding of the actual definitions of these variables is superficial but informed by a variety of readings (3-4,8-9,10)

## References

Note that those references that refer to forum postings are only accessible to those that are enrolled in the Getting and Cleaning Data course running January 5, 2015 to February 2, 2015. References use Vancouver style which puts a number in brackets in the text to indicate a citation and arranges the reference list by ascending numerical order by citation number.

1. FAQs [Internet]. [cited 2015 Jan 25]. Available from: http://www.icpsr.umich.edu/icpsrweb/ICPSR/support/faqs/2006/01/what-is-codebook
2. Activity recognition - Wikipedia, the free encyclopedia [Internet]. [cited 2015 Jan 25]. Available from: http://en.wikipedia.org/wiki/Activity_recognition
3. Anguita D, Ghio A, Oneto L, Parra X, Reyes-Ortiz JL. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
4. Anguita. A Public Domain Dataset for Human Activity Recognition Using Smartphones (Conference Paper). 2013. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013.
5. What We Do | ORCATECH [Internet]. Oregon Health & Science University. [cited 2015 Jan 25]. Available from: http://www.ohsu.edu/xd/research/centers-institutes/orcatech/about/welcome.cfm  
6. Dodge HH, Mattek NC, Austin D, Hayes TL, Kaye JA. In-home walking speeds and variability trajectories associated with mild cognitive impairment. Neurology. 2012; 78(24): 1946-52    
7. Fantechi A, Nugent CD, Pinzuti A, Vicario E, Magherini T. An On-line system for automated recognition of human activities. European Journal of Law and Technology [Internet]. 2013 Aug 12;4(2). Available from: http://ejlt.org/article/view/189   
8. Anguita D, Ghio A, Oneto L, Parra X, Reyes-Ortiz JL. Feature Selection (features_info.txt file included with the public domain dataset). Dec 2012. Available from http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip   
9. Anguita D, Ghio A, Oneto L, Parra X, Reyes-Ortiz JL. Human Activity Recognition Using Smartphones Dataset
Version 1.0 (README.txt file included with the public domain dataset). Dec 2012. Available from http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip 
10. Bayat A, Pomplun M, Tran DA. A Study on Human Activity Recognition Using Accelerometer Data from Smartphones. Procedia Computer Science. 2014;34:450–7. 






