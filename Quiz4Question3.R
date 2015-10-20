set.seed(3523)
library(AppliedPredictiveModeling)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

library(elasticnet)
set.seed(233)
modelFit.lasso = train(CompressiveStrength ~., method="lasso", data=training)
print(modelFit.lasso)
plot.enet(modelFit.lasso$finalModel,xvar="penalty",use.color=T)