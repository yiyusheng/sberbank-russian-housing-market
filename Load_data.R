#!/usr/bin/env python2
# -*- coding: utf-8 -*-
# Filename: Load_data.R
#
# Description: 
#
# Copyright (c) 2017, Yusheng Yi <yiyusheng.hust@gmail.com>
#
# Version 1.0
#
# Initial created: 2017-05-03 20:44:40
#
# Last   modified: 2017-05-03 20:44:42
#
#
#

rm(list = ls());setwd('~/Code/R/Kaggle/sberbank-russian-housing-market/');source('~/rhead')
train <- read.csv(file.path(dir_data,'train.csv'))
test <- read.csv(file.path(dir_data,'test.csv'))
macro <- read.csv(file.path(dir_data,'macro.csv'))
train$timestamp <- as.p(train$timestamp)
test$timestamp <- as.p(test$timestamp)
macro$timestamp <- as.p(macro$timestamp)
save(train,test,macro,file = file.path(dir_data,'Load_data.Rda'))
