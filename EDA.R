#!/usr/bin/env python2
# -*- coding: utf-8 -*-
# Filename: EDA.R
#
# Description: 
#
# Copyright (c) 2017, Yusheng Yi <yiyusheng.hust@gmail.com>
#
# Version 1.0
#
# Initial created: 2017-05-04 20:14:37
#
# Last   modified: 2017-05-04 20:14:38
#
#
#

rm(list = ls());setwd('~/Code/R/Kaggle/sberbank-russian-housing-market/');source('~/rhead')
load(file = file.path(dir_data,'Load_data.Rda'))
TR <- train;TE <- test;MA <- macro

# F1.price_doc
ggplot(TR,aes(price_doc)) + geom_histogram(bins = 50)
ggplot(TR,aes(log(price_doc))) + geom_histogram(bins = 50)

# F2.median housing price change with time
TR$yearmonth <- with(TR,paste(format(timestamp,'%Y'),format(timestamp,'%m'),sep=''))
median_price <- melt(tapply(TR$price_doc,TR$yearmonth,median))
names(median_price) <- c('yearmonth','price')
ggplot(median_price,aes(as.character(yearmonth),price)) + geom_bar(stat = 'identity') + xlab('Year Month') + ylab('Median Price') +
  theme(axis.text.x = element_text(angle = 90, size = 12))

# F3.data types
dtype <- melt(lapply(train,class))
table(unlist(dtype))
