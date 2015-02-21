#set work directory
  setwd("./UCI HAR Dataset")

#remove all old var
  rm(list=ls())

#remove README and features_info files from folder
  if(file.exists("./README.txt")){
    file.remove("./README.txt")
  }
  if(file.exists("./features_info.txt")){
    file.remove("./features_info.txt")
  }
  
# get folders
  diret<-list.dirs(full.names =TRUE, recursive=FALSE)
  diret<-c(".",diret)
  files=NULL
  vari=NULL
  Y=NULL
  X=NULL

#get file names and addresses
  for ( j in 1:length(diret)){
    files<-c(files,list.files(path=diret[j], pattern=".txt", full.names=TRUE))
    vari <-c(vari,list.files(path=diret[j], pattern=".txt"))
  }

#clear vari variable
  vari<-gsub(".txt", "", vari)
  vari<-cbind(vari,files)

#create variables in environmen
  for(j in 1:length(vari[,2])){
    assign(vari[j,1],read.table(vari[j,2], quote="\""))
  }

#Open library dplyr
  library(dplyr)

#Create a data table for train
  Train=NULL
  Train<-y_train
  Train[,2]<-subject_train
  Train[,3:564]<-X_train

#Create a data table for test
  Test<-y_test
  Test[,2]<-subject_test
  Test[,3:564]<-X_test

#Merge train and test
  Data<-rbind(Train,Test)

#Give name to collumns
  names<-c("Activity","Subject",as.character(features[,2]))
  colnames(Data)<-names
  
#Give names to Activities  
  for (i in 1:length(activity_labels[,2])){
    Data$Activity<-gsub(i,activity_labels[i,2],Data$Activity)
  }
  
#Extract columns with Mean and standart deviatio  
  Data<-Data[,-564]
  Data_Cleaned<-select(Data,contains("Activity"),contains("Subject"),contains("mean"),contains("std"))

#summarise data with means
Final<-(Data_Cleaned%>%
          group_by(Activity,Subject)%>%
          summarise_each(funs(mean)))


write.table(Final,"./Final.txt",sep=" ",row.name=FALSE) 