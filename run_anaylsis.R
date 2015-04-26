## This script reads in accelorametor data from the Samsung Galaxy S smartphones and distills it
## into a single useable data set.

## Step 0: Read in required files
        features <- read.table(".\\UCI HAR Dataset\\features.txt")
        act.label <- read.table(".\\UCI HAR Dataset\\activity_labels.txt")
        
        ## Read in training sets
        train.act <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt")
        xtrain <- read.table(".\\UCI HAR Dataset\\train\\x_train.txt")
        train.sub <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")
        
        ## Combine Training files
        training <- cbind(train.sub, train.act, xtrain)
        rm(train.sub, train.act, xtrain)
        
        ## Read in test sets
        test.act <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt")
        xtest <- read.table(".\\UCI HAR Dataset\\test\\x_test.txt")
        test.sub <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")

        ## Combine Test files
        test <- cbind(test.sub, test.act, xtest)
        rm(test.sub, test.act, xtest)
        
## Step 1: Merges the training and the test sets to create one data set.
        a.data <- rbind(test,training)
        
## Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
        tmp <- grep("std()|mean()", features$V2)
        columns <- c(1,2,tmp+2)
        act.data <- a.data[,columns]

## Step 3: Uses descriptive activity names to name the activities in the data set
        act.label[,2] <- as.character(act.label[,2])
        ## First, let's fix the spelling
        act.label[6,2] <- "LYING"
        ## Then, we create the factorized activity data (this could be done in less steps)
        a.temp <- act.data$V1.1
        test1 <- factor(a.temp, levels = act.label$V1, labels = act.label$V2)
        act.data$V1.1 <- test1
        ##clean up
        rm(a.temp,test1)
## Step 4: Appropriately labels the data set with descriptive variable names. 
        ## create character vector of column names
        temp <- features[tmp,2]
        temp <- as.character(temp)
        ## add labels for the first two columns
        data.labels <- c("subject","activity", temp)
        ## label the data!
        names(act.data) <- data.labels
        ## Clean up!
        rm(data.labels,a.data,act.label,features,test,training,columns,tmp)
## Step 5: From the data set in step 4, creates a second, independent tidy data set
##         with the average of each variable for each activity and each subject.
        ## Since we will be using dcast, let's load the correct library
        library(reshape2)
        ## Now melt data to get one variable column
        melted <- melt(act.data,id=c("subject","activity"),measure.vars=temp)
        ## And dcast to get the mean for each measurment
        act.mean <- dcast(melted, subject + activity ~ variable, mean)
        ## Final Cleanup
        rm(melted, temp)