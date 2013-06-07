#install.packages('reshape2')
#install.package('e1071')
library('reshape2')
library('e1071')

load('data.Rd')
testNum <- nrow(im.train);

im1 <- im.train[1:testNum,];
train1 <- d.train[1:testNum,];
#test1 <- im.test[1:3,];
test1 <- im.test;

colPred <- function(name) {
   mySvm <- svm(im1, train1[,name]);
   return(predict(mySvm, test1));
}

num <- nrow(test1)
imageIds <- c(1 : num)


example.submission <- read.csv(paste0(data.dir, 'submissionFileFormat.csv'))
example.submission$Location <- NULL
submission <- example.submission;
submission <- transform(submission, FeatureName = as.character(FeatureName))
submission$Location <- NULL
#$memory restriction, so I use 1000 first
#name <- "left_eye_center_x";
mainMatrix <- NULL

for (name in names(train1)) {

        predResult <- colPred(name);

        colNames <- rep(name, num)
        lst <- c(imageIds, colNames, predResult)
        mat <- matrix(lst, nrow=num, ncol=3)
        colnames(mat) <- c("ImageId", "FeatureName", "Location")
        #sub.col.names      <- names(example.submission)
        if (is.null(mainMatrix)) {
                mainMatrix <- mat;
        } else {
                mainMatrix <- rbind(mainMatrix, mat);
"rft.r" 59L, 1621C                                                                                                                            1,1           Top
