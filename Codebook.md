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

Twenty one of the subjects (70%) were arbitrarily chosen to be in the TRAIN sample which was used to 'train' the computer in recognizing human activities (these were subjects 1,3,5,6,7,8,11,14,15,16,17,19,21,22,23,25,26,27,28,29,30). The measurements obtained from the 9 subjects in the TEST sample (subjects 2,4,9,10,12,13,18,20,24) were then examined by the computer and assigned an 'activity' based on what it had 'learned' examining the TRAIN sample's measurements. (4)

## Data Processing

The raw data obtained from the phone sensors were filtered to remove noise. (4) The resulting signals were processed mathematically, split into separate components (i.e. acceleration signal split into "gravitational and body motion components" (4, p439)) and in some cases re-sampled to create 10 signals all of which had a time component and 7 of which had a frequency component. These 17 signals were then 'measured' using a variety of methods to create the majority of the 561 variables included in the original dataset. These methods included taking the signal's mean, its standard deviation and its min and max. (8) Of the measurement methods some were applied to all signal types while some were only applied to time domain signals and others to frequency domain signals. (8) 



## Data Quality

The 

## Variables

### Modification to the Variable Names


### Variable List

Subject

Activity

tBodyAcc.mean__.X   

tBodyAcc.mean__.Y   

tBodyAcc.mean__.Z   
   
tBodyAcc.std__.Y   

tBodyAcc.std__.Z   

tGravityAcc.mean__.X   

tGravityAcc.mean__.Y   

tGravityAcc.mean__.Z   

tGravityAcc.std__.X   

tGravityAcc.std__.Y   

tGravityAcc.std__.Z   

tBodyAccJerk.mean__.X   

tBodyAccJerk.mean__.Y   

tBodyAccJerk.mean__.Z   

tBodyAccJerk.std__.X   

tBodyAccJerk.std__.Y   

tBodyAccJerk.std__.Z   

tBodyGyro.mean__.X   

tBodyGyro.mean__.Y   

tBodyGyro.mean__.Z   

tBodyGyro.std__.X   

tBodyGyro.std__.Y   

tBodyGyro.std__.Z   

tBodyGyroJerk.mean__.X   

tBodyGyroJerk.mean__.Y   

tBodyGyroJerk.mean__.Z   

tBodyGyroJerk.std__.X   

tBodyGyroJerk.std__.Y   

tBodyGyroJerk.std__.Z   

tBodyAccMag.mean__   

tBodyAccMag.std__   

tGravityAccMag.mean__   

tGravityAccMag.std__   

tBodyAccJerkMag.mean__   

tBodyAccJerkMag.std__   

tBodyGyroMag.mean__   

tBodyGyroMag.std__   

tBodyGyroJerkMag.mean__   

tBodyGyroJerkMag.std__   

fBodyAcc.mean__.X   

fBodyAcc.mean__.Y   

fBodyAcc.mean__.Z   

fBodyAcc.std__.X   

fBodyAcc.std__.Y   

fBodyAcc.std__.Z   

fBodyAccJerk.mean__.X   

fBodyAccJerk.mean__.Y   

fBodyAccJerk.mean__.Z   

fBodyAccJerk.std__.X   

fBodyAccJerk.std__.Y   

fBodyAccJerk.std__.Z   

fBodyGyro.mean__.X   

fBodyGyro.mean__.Y   

fBodyGyro.mean__.Z   

fBodyGyro.std__.X   

fBodyGyro.std__.Y   

fBodyGyro.std__.Z   

fBodyAccMag.mean__   

fBodyAccMag.std__   

fBodyAccJerkMag.mean__   

fBodyAccJerkMag.std__   

fBodyGyroMag.mean__   

fBodyGyroMag.std__   

fBodyGyroJerkMag.mean__   

fBodyGyroJerkMag.std__   

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



