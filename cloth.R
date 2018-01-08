library(ggplot2)
temp <- read.table("/Users/weiyeyao/Documents/incubator/t2.txt", header=FALSE)
precip <- read.table("/Users/weiyeyao/Documents/incubator/p2.txt", header=FALSE)
temp2 <- as.data.frame(t(as.matrix(temp)))
precip2 <- as.data.frame(t(as.matrix(precip)))
indat<-read.csv("/Users/weiyeyao/Documents/incubator/report.csv")
df <- as.data.frame(indat)
df$temperature <- temp2$V1
df$precipitation <- precip2$V1
df <- df[c('temperature', 'precipitation', 'Swimsuit','Jeans','coat','Shirt')]
df2 <- df[c('temperature', 'precipitation', 'Swimsuit')]
str(df2)

x = 1:603
plot(df)
plot(x,df$precipitation,col = "blue", type = 'l',asp = 0.25,ylab="")
par(new=T)
plot(x, df$Jeans,col = "red", type = 'l',ylab="")
legend(x="bottomright", c("Swimsuit", "Temperature"), col=c("red","blue"),lty=c(1,1))


tempOutcome <- df$Swimsuit
outcomeName <- 'Swimsuit'
predictorNames <- names(df2)[names(total) != outcomeName]

getModelInfo()$glmnet$type

set.seed(34560)
splitIndex <- createDataPartition (df2[,outcomeName], p =0.70, list = FALSE, times = 1)
traindf  <- total[splitIndex,]
testdf   <- total[-splitIndex,]
#objControl <-trainControl (method = 'cv', number = 10, returnResamp = 'none')
objModel <- train(traindf[,predictorNames], trainTitanic[,outcomeName], method='glmnet',  metric = "RMSE")

predictions <- predict (object = objModel, testdf[, predictorNames])
auc <- roc(testdf[,outcomeName], predictions)
print(auc$auc)

summary(objModel)
objModel

plot(varImp(objModel,scale=F))


