# run_analysis.R

This README file describes how the R-script run_analysis.R transforms data from the inertial sensors of a smartphone into a tidy summarized data set.

## Input
The recordings of 30 subjects performing activities of daily living while carrying a waist-mounted smartphone with embedded inertial sensors. 
The data is split into training and test datasets and is stored in these 8 files:  
X_test.txt  
y_test.txt  
subject_test.txt  
X_train.txt  
y_train.txt  
subject_train.txt  
features.txt  
activity_labels.txt  

Find a full description of the data here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Output

The output is a tidy dataset that contains the mean of selected variables averaged over subjects and activities. Details about the variables in the output datasets are described in CodeBook.md.

## Processing Steps

### Step1
All the files are loaded and for X, y, and subject, training and test data are put together using rbind().
While X contains 561 variables derived from the raw data from the inertial sensors for over 10000 observations, y contains the activity performed during each observation and subject contains a subject id for the person performing the activity for each observation.

Features contains the variable names, so we use those as row names for X

### Step2

In the next step we select only columns that contain the strings "mean()" or "std()" for our dataset, and add y (activity) and subject as additional columns. This step reduces the number of columns to 68.

### Step3

Since y uses integers 1,...,6 for the 6 different activities, we replace this column in our dataset with the appropriate activity names. These are found in activity_labels.txt.

### Step4

We update all columns names in our dataset to make them more readable. 
The first two columns are "subject" and "activity", the following columns are the measurement variables.
We clean those up by removing non-alphanumerics and using more descriptive names.

### Step5

This step creates the output dataset. For each subject/activity combination we calculate the mean of each variable.
We use a wide form that results in a dataset with 180 rows and 68 columns.


