#1. Merges the training and the test sets to create one data set.

#test
datasetXTest <- read.csv("test/X_test.txt",sep = "",header = F)
datasetYTest <- read.csv("test/Y_test.txt",sep="",header=F)
datasetSubjectTest <- read.csv("test/subject_test.txt", sep="",header=F)

#train
datasetXTrain <- read.csv("train/X_train.txt",sep = "",header = F)
datasetYTrain <- read.csv("train/Y_train.txt",sep="",header=F)
datasetSubjectTrain <- read.csv("train/subject_train.txt", sep="",header=F)


#dataset X 
dataSetXFinal <- rbind( datasetXTest,datasetXTrain)

#dataset Y  (Activitys)
datasetYFinal <- rbind(datasetYTest,datasetYTrain)

#dataset Subject 
datasetSubject <- rbind(datasetSubjectTest,datasetSubjectTrain)

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
namesDataSet <- read.csv("features.txt",header=F, sep=" ")[,2]
meanAndStdFeatures <- grep("-(mean|std)\\(\\)", namesDataSet)
colnames(dataSetXFinal) <- namesDataSet
#data set with mean and std labels
dataSetMeanAndStdFeatures <- dataSetXFinal[,meanAndStdFeatures]

#3. Use descriptive activity names to name the activities in the data set
activitys <- read.csv("activity_labels.txt",header=F, sep = "")[,2]
datasetYFinal[,1] <- activitys[datasetYFinal[,1]]

#4. Appropriately labels the data set with descriptive variable names. 
names(datasetYFinal) <- "activity"
names(datasetSubject) <- "subject"

#merge all data frames 

dataSetTiny <- cbind(datasetYFinal,datasetSubject,dataSetMeanAndStdFeatures)

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

meansGroupByActivityAndSubject <- aggregate(. ~subject + activity, dataSetTiny, mean)

write.table(meansGroupByActivityAndSubject,"meansGroupByActivityAndSubjectDataSet.txt", row.names = F )

