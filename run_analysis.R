run_analysis<-function(){

  X_train<-read.table("./X_train.txt")
  y_train<-read.table("./y_train.txt")
  subject_train<-read.table("./subject_train.txt")
  #read the 3 text data for train
  
  traindt<-cbind(subject_train,y_train,X_train)
  
  X_test<-read.table("./X_test.txt")
  y_test<-read.table("./y_test.txt")
  subject_test<-read.table("./subject_test.txt")
  #read the 3 text data for test
  
  testdt<-cbind(subject_test,y_test,X_test)
  
  train_test_dt<-rbind(traindt,testdt)
  #merge the rows of the 2 data sets
  
  features<-read.table("./features.txt")
  features<-as.character(features[,2])
  #features[,2] subset the second column of features, but the subset is still a factor
  #now features is converted as a character vector
  
  features<-append(features,c("Subject","Activity"),after=0)
  #append features with the 2 column names
  
  meanstd<-grep("Subject|Activity|std|mean",features)
  #give the position of the mean and std variables also and add the 2 first column to be kept
  
  mean_std_dt<-train_test_dt[,meanstd]
  features_mean_std<-features[meanstd]
  #subset the dataframe and the features to the variables we are interested in
  
  
  names(mean_std_dt)<-features_mean_std
  #replace the names of the datasets with the features (only mean an std selected)
  
  activity<-read.table("./activity_labels.txt")
  activity<-as.character(activity[,2])
  #like with features, we transform the table activity into a character vector
  
  mean_std_dt$Activity<-factor(mean_std_dt$Activity)
  levels(mean_std_dt$Activity)<-activity
  #we use the activity as a factor to assign the activity names
  
  features_mean_std<-sub("()","",features_mean_std,fixed=TRUE)
  features_mean_std<-sub("^t","Time.",features_mean_std)
  features_mean_std<-sub("^f","FrequencyDomain.",features_mean_std)
  features_mean_std<-sub("Acc",".Acceleration",features_mean_std,fixed=TRUE)
  features_mean_std<-sub("-",".",features_mean_std,fixed=TRUE)
  #set more explicit column names
  
  colnames(mean_std_dt)<-features_mean_std
  #reassign the new column names to the data
  
  #mean_std_dt is now the tidy data, let's summarize it
  
  library(dplyr)
  
  tidy<-tbl_df(mean_std_dt)
  tidy<-group_by(tidy,Subject,Activity)
  tidy<-summarize_all(tidy,funs(mean))
  #use dplyr to group the data by subject and activity and summarise everything
  
  tidy
  
}

