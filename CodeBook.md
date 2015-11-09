#Variables

* `datasetXTest`, `datasetYTest`, `datasetSubjectTest` are the data frames that contain the data from the test data set.
* `datasetYTest`, `datasetYTrain`, `datasetSubjectTrain` are the data frames that contain the data from the training data set.

* `dataSetXFinal` represents all the X variables. It is the combination of  `datasetXTest` and `datasetYTest`.
* `dataSetYFinal` represents all the activities registers. It is the combination of  `datasetYTest` and `datasetYTest`.
* `datasetSubject` represents all the subjects registers. Its is the combination of  `datasetSubjectTest` and `datasetSubjectTest`.

* `namesDataSet` contains all the features names for `dataSetXFinal`.
* `meanAndStdFeatures` contains the filter of features that contain the substring either `mean` or  `str`.
* `dataSetMeanAndStdFeatures` contains the columns of `dataSetXFinal` that contain the substtring either `mean` or  `str`.

* `activitys` contains the factor names for the activities readed from "activity_labels.txt".

* `dataSetTiny` is our clean data set. It's the combination of the three data sets: `datasetSubject`, `dataSetYFinal` and `dataSetXFinal`.

* `meansGroupByActivityAndSubject` is the `dataSetTiny` gruoped by `activity` and `subject`.
