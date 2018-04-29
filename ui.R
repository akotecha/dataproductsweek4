#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
  titlePanel("Prediction of miles per gallon in the mtcars dataset"),
  sidebarLayout(
    sidebarPanel(
      helpText("This app uses a linear model built off R's mtcars dataset to predict the efficiency of a car (measured by
                predicted miles per gallon (mpg))"),
      helpText("The model predicts mpg using 3 variables: the car weight, quarter mile time and transmission type"),
      helpText("Toggle the parameters below to generate the output to the right of the page:"),
      sliderInput(inputId = "inwt",
                  label = "Weight (1000 lbs):",
                  value = 3,
                  min = 2,
                  max = 5,
                  step = 0.5),
      sliderInput(inputId = "inqsec",
                  label = "Quarter Mile Time (secs):",
                  value = 18,
                  min = 15,
                  max = 22,
                  step = 1),
      radioButtons(inputId = "inam",
                   label = "Transmission:",
                   choices = c("Automatic"="0", "Manual"="1"),
                   inline = TRUE)
    ),
    
    mainPanel(
      htmlOutput("pText"),
      htmlOutput("pred")
    )
  )
))
