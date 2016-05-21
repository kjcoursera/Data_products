library(shiny)
library(markdown)

feature.list <- list("Age" = "Age", "Sex" ="Sex",
                     "ChestPainType"= "ChestPainType","RestBloodPressure" = "RestBloodPressure",
                     "SerumCholestrol"="SerumCholestrol","FastingBloodSugar"="FastingBloodSugar",
                     "RestElectrocardiographic"="RestElectrocardiographic","MaxHeartRate"="MaxHeartRate",
                     "ExerciseInduced"="ExerciseInduced","Oldpeak"="Oldpeak",
                     "Slope"="Slope","MajorVessels"="MajorVessels","Thal"="Thal")

# Define UI for application that draws a histogram
shinyUI(navbarPage("Exploring Heart Dataset Using Various Machine Learning Classifiers",
                   tabPanel("BackGround",
                            mainPanel(
                                    includeMarkdown("background.md")
                                        )
                   ),
                   tabPanel("Classifiers",
                                sidebarLayout(
                                        sidebarPanel(
                                                helpText("Select the features and classifier"),
                                                checkboxGroupInput("checkGroup", label = h3("Dataset Features:"), 
                                                                        choices = feature.list, inline = F,
                                                                        selected = names(feature.list) ),
                                                radioButtons("model", label = h3("Model method:"),
                                                        c("RPART" = "rpart", 
                                                            "Random Forest" = "rf", 
                                                            "gbm" = "gbm" ))
                                        ),
                                        mainPanel(
                                                verticalLayout(
                                                        tabsetPanel(type = "tabs", tabPanel("Model Fit", verbatimTextOutput("fit.out"))),
                                                        tabsetPanel(type = "tabs", tabPanel("Confusion Matrix ", tableOutput("table.out"))),
                                                        tabsetPanel(type = "tabs", tabPanel("Variable Importance Plot", plotOutput("VarImp.out"))),
                                                        tabsetPanel(type = "tabs", tabPanel("Plot", plotOutput("pred.out")))
                                                        #tabsetPanel(type = "tabs", tabPanel("Density Plot", plotOutput("dens.out")))
                                                        #
                                                )))
                   ),
                   
                   tabPanel("Datset Description",
                            mainPanel(
                        includeMarkdown("description.md"))
                   )
                   
))
                                            
                                            
        