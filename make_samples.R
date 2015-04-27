# install.packages(ElemStatLearn)
rm(list=ls())


library(ElemStatLearn) # for data
data("prostate")
data("spam")

library(magrittr) # for piping
library(dplyr) # for handeling data frames



# Continous outcome:
prostate.train <- prostate %>% 
  filter(train) %>% 
  select(-train)
prostate.test <- prostate %>% 
  filter(!train) %>% 
  select(-train)
y.train <- prostate.train$lcavol
X.train <- prostate.train %>% select(-lcavol) %>% as.matrix
View(X.train)
y.test <- prostate.test$lcavol 
X.test <- prostate.test %>% select(-lcavol) %>% as.matrix



# Categorical outcome:
n <- nrow(spam)

train.prop <- 0.66
train.ind <- c(TRUE,FALSE) %>%  
  sample(size = n, prob = c(train.prop,1-train.prop), replace=TRUE)
spam.train <- spam[train.ind,]
spam.test <- spam[!train.ind,]

y.train.spam <- spam.train$spam
X.train.spam <- spam.train %>% select(-spam) %>% as.matrix
y.test.spam <- spam.test$spam
X.test.spam <- spam.test %>% select(-spam) %>% as.matrix

spam.dummy <- spam %>% mutate(spam=as.numeric(spam=='spam'))
spam.train.dummy <- spam.dummy[train.ind,]
spam.test.dummy <- spam.dummy[!train.ind,]


