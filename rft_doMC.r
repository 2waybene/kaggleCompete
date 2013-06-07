#install.packages('reshape2')
#install.package('e1071')
library('reshape2')
library('e1071')
setwd ("/home/jianying/kaggle/facial_keypoint_detection/dataDir/")
load('data.Rd')
library(doMC);
registerDoMC();

data.dir <- "/home/jianying/kaggle/facial_keypoint_detection/dataDir/"
#testNum <- 100;
testNum <- nrow(d.train)
im1 <- im.train[1 : testNum,];
train1 <- d.train[1: testNum,];
#test1 <- im.test[1:3,];
#test1 <- im.test[4200:4300,];
test1 <- im.train[4264:4265,];

colPred <- function(name) {
   mySvm <- svm(im1, train1[,name]);
   return(predict(mySvm, test1));
}

num <- nrow(test1)
"rft_doMC.r" 57L, 1663C                                                                                                  11,1          Top
