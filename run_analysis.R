library(data.table)
library(dplyr)

# Set directory, filename and full path
        proj_dir <- "./UCI HAR Dataset"
        filename <- "project_data.zip"
        full_path <- paste0(proj_dir,"/",filename)

# Check if directory exists
        if(!file.exists(proj_dir)){
                dir.create(proj_dir)
        }

# Check if file already exists. If not, download it. Unzip it after all.
        if(!file.exists(full_path)){
                dataset_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
                download.file(dataset_url, destfile = full_path)
                unzip(full_path)
        }

# Create data tables for each file necessary for the analysis
        actlabels <- read.table(paste0(proj_dir, "/activity_labels.txt"), col.names = c("id", "activity"))
        features <- read.table(paste0(proj_dir, "/features.txt"), col.names = c("id", "feature"))
        subtest <- read.table(paste0(proj_dir, "/test/subject_test.txt"), col.names = "subject")
        xtest <- read.table(paste0(proj_dir, "/test/X_test.txt"), col.names = features$feature)
        ytest <- read.table(paste0(proj_dir, "/test/y_test.txt"), col.names = "activityid")
        subtrain <- read.table(paste0(proj_dir, "/train/subject_train.txt"), col.names = "subject")
        xtrain <- read.table(paste0(proj_dir, "/train/X_train.txt"), col.names = features$feature)
        ytrain <- read.table(paste0(proj_dir, "/train/y_train.txt"), col.names = "activityid")

# Merges the previously created tables into one single data set
        subbind <- bind_rows(subtest, subtrain)
        xbind <- bind_rows(xtest, xtrain)
        ybind <- bind_rows(ytest, ytrain)
        merged_dataset <- bind_cols(subbind, xbind, ybind)

# Remove unuseful  objects from the global environment
        rm(list = ls()[! ls() %in% list("actlabels", "features", "merged_dataset", "proj_dir")])

# Select only the columns containing mean and standard deviation measures
        tidy_dataset <- merged_dataset %>%
                select(subject, activityid, contains("mean"), contains("std")) %>%
                # Change the activity id for a descriptive activity name
                mutate(activityid = actlabels[activityid, 2])

# Properly names the activity variable 
        names(tidy_dataset)[2] <- "activity"

# Creates a dataset with the average of each variable grouped by activity and subject
        avg_activity_subject <- tidy_dataset %>%
                group_by(activity, subject) %>%
                summarize(across(.cols = everything(), mean))

        write.table(avg_activity_subject, file = "tidydataset.txt", row.names = FALSE)
