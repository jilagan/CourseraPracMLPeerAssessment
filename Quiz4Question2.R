library(caret)
library(gbm)
set.seed(3433)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

library(MASS)
set.seed(62433)
modelFit.rf<-train(diagnosis~.,method="rf",data=training)
pred.rf<-predict(modelFit.rf,newdata=testing)
acc.rf<-confusionMatrix(testing$diagnosis,pred.rf)
print(acc.rf$overall[1]) #0.7804878 

modelFit.gbm <- train(diagnosis~.,method="gbm",data=training,verbose=FALSE)
pred.gbm<-predict(modelFit.gbm,newdata=testing)
acc.gbm<-confusionMatrix(testing$diagnosis,pred.gbm)
print(acc.gbm$overall[1]) #0.804878 

modelFit.lda <- train(diagnosis~.,method="lda",data=training)
pred.lda<-predict(modelFit.lda,newdata=testing)
acc.lda<-confusionMatrix(testing$diagnosis,pred.lda)
print(acc.lda$overall[1]) #0.7682927 

predDF <- data.frame(pred.rf,pred.gbm,pred.lda,diagnosis=testing$diagnosis)
modelFit.comb<-train(diagnosis~.,method="rf",data=predDF)
pred.comb <- predict(modelFit.comb,predDF)
acc.comb <- confusionMatrix(testing$diagnosis,pred.comb)
print(acc.comb$overall[1]) #0.8170732