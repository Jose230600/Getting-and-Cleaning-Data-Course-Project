setwd("D:\\econimoia 2\\Big data\\Curso8\\UCI HAR Dataset")

TESTX <- read.table("./test/X_test.txt")
TESTY <- read.table("./test/Y_test.txt")
TESTSUB <- read.table("./test/subject_test.txt")

TRAINX <- read.table("./train/X_train.txt")
TRAINY <- read.table("./train/Y_train.txt")
TRAINSUB <- read.table("./train/subject_train.txt")

# Merges the training and the test sets to create one data set. ( 1 Objective part 1)

TOTALx   <- rbind(TRAINX, TESTX)
TOTALy   <- rbind(TRAINY, TESTY) 
TOTALsub <- rbind(TRAINSUB, TESTSUB)

VariableNames <- read.table("./features.txt")

# Extracts only the measurements on the mean and standard deviation for each measurement.( 2 Objective)

SelectedVariable <- VariableNames[grep("mean\\(\\)|std\\(\\)",VariableNames[,2]),]
SecondObjective <- TOTALx[,SelectedVariable[,1]]

# use descriptive activity names to name the activities in the data set ( 3 Objective)


colnames(TOTALy)   <- "ActivityID"
colnames(TOTALsub) <- "SubjectID"

# Appropriately labels the data set with descriptive variable names. ( 4 Objective)

colnames(SecondObjective)   <- SelectedVariable[,2]

# Merges the training and the test sets to create one data set. ( 1 Objective complete)

FirstObjective <- cbind(TOTALsub, TOTALy, SecondObjective)

ActivityLabels <- read.table("./activity_labels.txt") 

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. ( 5 Objective)

colnames(ActivityLabels) <- c('ActivityID','ActivityType')

FifthObjective = merge(FirstObjective, ActivityLabels, by='ActivityID', all.x=TRUE)

Tidy <- aggregate(. ~SubjectID + ActivityID, FifthObjective, mean)
Tidy <- Tidy[order(Tidy$SubjectID, Tidy$ActivityID), ]

Tidy$ActivityID <- factor(Tidy$ActivityType, levels = ActivityLabels[,1], labels = ActivityLabels[,2]) 
Tidy$SubjectID  <- as.factor(Tidy$SubjectID) 


write.table(Tidy, file = "Tidy.txt", row.names = FALSE, col.names = TRUE)
