# Getting And Cleaning Data Project

To generate the resultant data set, first extract the source data from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Then run the script run_analysis.R in the directory containing the UCI HAR Dataset.

The variable 'averages' contains the resultants dataset.


# Explanation of the run_analysis.R script
The source data in UCI HAR Dataset contains both test and training data.  The run_analysis.R script reads in both the test and training data, as well as data identifying the subject for each obervation, the activities for each observation, the activity labels and the variable names (described as features).

The variables containing std() and mean() are extracted from test and training data sets.  the observations from the test and training data sets are combined into a single data set, and the subject, activity and vairables names are added also.

The data is then grouped by activity and subject, and the averages calculated for each remaining variable.

The resultant dataset, is called "averages".  This has been written to the txt file tidyaverages.txt

