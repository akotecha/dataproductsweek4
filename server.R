library(shiny)
library(HistData)
data(mtcars)
library(dplyr)
library(ggplot2)

# linear model
model1 <- lm(mpg ~ wt+qsec+factor(am), data = mtcars)

shinyServer(function(input, output) {
  output$pText <- renderText({
    trans <- ifelse(
      input$inam=="0",
      "Automatic",
      "Manual"
    )
    paste("Weight is",
          strong(round(input$inwt, 1)*1000),
          " lbs, and quarter mile time is",
          strong(round(input$inqsec, 1)),
          "secs, and transmission type is",
          em(strong(trans)), "then:")
  })
  output$pred <- renderText({
    df <- data.frame(wt = input$inwt,
                     qsec = input$inqsec,
                     am = factor(input$inam))
    ch <- predict(model1, newdata=df)

    paste0("Predicted efficiency is going to be around ",
           em(strong(round(ch))),
           " mpg"
    )
  })

})