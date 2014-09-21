
#setting working directory where is data unzipped
setwd("C:\\UCI HAR Dataset") 

#loading descriptive activity names
activity.names <- read.table("activity_labels.txt", col.names=c("activity_id", "activity")) 

#loading column names
feature.names <- read.table("features.txt", col.names=c("feature_id", "feature")) 

# Fix the variable names
feature.names$feature <- gsub("-mean\\(\\)", ".Mean", feature.names$feature) 
feature.names$feature <- gsub("-std\\(\\)", ".Std", feature.names$feature ) 
feature.names$feature <- gsub("[()]", "", feature.names$feature ) 
feature.names$feature <- gsub("[,]", "", feature.names$feature ) 
feature.names$feature <- gsub("[-]", ".", feature.names$feature ) 


#loading test set x
x.test <- read.table("test\\X_test.txt", col.names=feature.names$feature)
#loading and binding subject
x.test <- cbind(x.test, read.table("test\\subject_test.txt", col.names=c("subject")))
#loading and binding activity
x.test <- cbind(x.test, read.table("test\\y_test.txt", col.names=c("activity_id")))


#loading train set x
x.train <- read.table("train\\X_train.txt", col.names=feature.names$feature)
#loading and binding subject
x.train <- cbind(x.train, read.table("train\\subject_train.txt", col.names=c("subject")))
#loading and binding activity
x.train <- cbind(x.train, read.table("train\\y_train.txt", col.names=c("activity_id")))

#merging test and train sets
data.all <- rbind(x.test, x.train)

#get current column names
col.names <- colnames(data.all)

#select columns only contains ".Mean", ".Std" (will be used for aggregations)
col.names.aggr <- c(col.names[grep("\\.Mean", col.names)], col.names[grep("\\.Std", col.names)])
# adding columns  "subject" and "activity_id"
col.names.selected <- c(col.names.aggr, col.names[grep("subject", col.names)], col.names[grep("activity_id", col.names)])

#select dataset based on filtered columns
data.selected <- data.all[,col.names.selected]

#aggrgate data
data.aggr <- aggregate(data.selected[,col.names.aggr],by=list(subject=data.selected$subject, activity_id=data.selected$activity_id),FUN=mean, na.rm=TRUE)

#merging with activity labels
data.tidy <- merge(activity.names,data.aggr,by.x="activity_id",by.y="activity_id",all=TRUE)

#saving to file
write.table(data.tidy,"./tidy_dataset.txt", row.name=FALSE)


