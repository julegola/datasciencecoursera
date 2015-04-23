# Code Book for tidydata.txt

This Code Book describes the meaning of the variables in the output dataset of run_analysis.R.
Please read the Code Book "features_info.txt" that describes the original data first. This also explains how the raw signal data was obtained and pre-processed.

###Our tidy dataset contains the following variables:

**activity**    Factor w/ 6 levels   
    Name of the activity performed by the subject during observation
    
**subject**    integer [1,..,30]  
    Id for subject performing activity during observation
    
The remaining 66 variables are all of class numeric. They all start with the string "mean", meaning they contain the average of a variable for a specific combination of subject and activity.

The names of these variables follow a pattern, symbolizing the observed signal and pre-processing. 

'XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

**TimeBodyAcceleroXYZ**  
**TimeGravityAcceleroXYZ**  
**TimeBodyAcceleroJerkXYZ**  
**TimeBodyGyroXYZ**  
**TimeBodyGyroJerkXYZ**  
**TimeBodyAcceleroMagnitude**  
**TimeGravityAcceleroMagnitude**  
**TimeBodyAcceleroJerkMagnitude**  
**TimeBodyGyroMagnitude**  
**TimeBodyGyroJerkMagnitude**  
**FrequBodyAcceleroXYZ**  
**FrequBodyAcceleroJerk-XYZ**  
**FrequBodyGyroXYZ**  
**FrequBodyAcceleroMagnitude**  
**FrequBodyAcceleroJerkMagnitude**  
**FrequBodyGyroMagnitude**  
**FrequBodyGyroJerkMagnitude**  
    
The set of variables that were estimated from these signals are: 

**Mean**: Mean value  
**Std**: Standard deviation

#####Abbreviations:  
Accelero  =  Accelerometer  
Gyro    =    Gyroscope  
Frequ    =   Frequency  
  
  
#####Examples:
**meanTimeBodyAcceleroJerkStdY** means the standard deviation of the time domain body linear acceleration Jerk signal on the Y axis averaged for a subject/activity combination

**meanFrequBodyGyroMagnitudeMean** means the mean of the Magnitude of the frequency domain angular velocity signal averaged for a subject/activity combination  
  
  

