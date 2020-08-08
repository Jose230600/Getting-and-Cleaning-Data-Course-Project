---
title: "README.md"
author: "Jose"
date: "7/8/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# Getting and Cleaning Data Course Project

This is the project to finish the "Getting and cleanig data" Course

### run_analysis.R

once set the Directory as the file extracted from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip the  x_train, y_train, x_test, y_test, subject_train and subject_test, features.txt, activity_labels.txt are read and transformed as you can see in the "CodeBook.md"

After the transformation, is written a tidy set that you can see in "Tidy.txt"

### CodeBook.md

Describes the Variables for the originial Data and the tidy data of "Tidy.txt", and the transformations that are used in the "run_analysis.R" 

### Tidy.txt

Shows the result of the writted table from "run_analysis.R" that is the transformation of the Original data to the tidy data set
