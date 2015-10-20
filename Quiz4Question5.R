set.seed(3523)
library(AppliedPredictiveModeling)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

set.seed(325)
library(e1071)
library(kernlab)

# modelFit.svm <- train(CompressiveStrength ~ ., data=training, method="svmRadial")
modelFit.svm <- svm(CompressiveStrength ~., data=training)
pred.svm <- predict(modelFit.svm, testing)
# acc.svm <- confusionMatrix(testing$CompressiveStrength,pred.svm)
acc.svm <- accuracy(pred.svm,testing$CompressiveStrength)
print(acc.svm)