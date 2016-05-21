library(shiny); 
library(caret); 
library(gbm);
library(randomForest);
library(e1071);
library(rpart)
library(ROCR)


### Functions ###
## Partition, Train, Output tables and plots




interact <- function( model,checkGroup){
        heart <- read.csv("./heart.dat",header = FALSE,sep=" ") 
        colnames(heart) <- c("Age","Sex","ChestPainType","RestBloodPressure","SerumCholestrol","FastingBloodSugar",
                             "RestElectrocardiographic","MaxHeartRate",
                             "ExerciseInduced","Oldpeak","Slope","MajorVessels",
                             "Thal","Class")
        
        names <- c("Sex","FastingBloodSugar","ExerciseInduced","RestElectrocardiographic","ChestPainType",
                   "Thal","Slope","Class")
        heart[,names] <- lapply(heart[,names], factor)
        heart$Class <- factor(heart$Class, levels = c(1,2),labels = c("Absence", "Presence"))
        heart$Slope <- ordered(heart$Slope)
        set.seed(1)
        inTrain <- createDataPartition(y=heart$Class,p=0.7,list = FALSE)
        training <- heart[inTrain,]
        testing <- heart[-inTrain,]
        fitControl <- trainControl(method = "repeatedcv",number = 10, repeats = 10,allowParallel=T)
        fit <- train(training$Class ~ ., method=model, trControl = fitControl,data=training[,checkGroup])
        model_class <- predict(fit, newdata = testing)
        model_pred <- predict(fit, newdata = testing, type = "prob")
        model_cm <- confusionMatrix(model_class, testing$Class)
        predmodel <- prediction(model_pred[,1], testing$Class)
        perfmodel <- performance(predmodel, "tpr", "fpr")
   
        out.finalModel <- fit$finalModel
        out.table <- model_cm$table
        out.VarImp <- plot(varImp(fit))
        out.pred <- plot(fit)
 
        
        
        list(out.finalModel = out.finalModel,
             out.table = out.table,
             out.VarImp = out.VarImp,
             out.pred = out.pred
             #out.dens = out.dens
        )
}

        
shinyServer(function(input, output) {
        ## A reactive expression executes when the inputs change.
        outs <- reactive({interact( input$model, input$checkGroup)})
        output$fit.out   <- renderPrint({outs()$out.finalModel})
        output$table.out <- renderTable({outs()$out.table})
        output$VarImp.out   <- renderPlot({outs()$out.VarImp})
        output$pred.out <- renderPlot({outs()$out.pred})
       
        
        
})



