library(shiny)
library(datasets)
library(ggformula)

mtcars$cyl <- as.factor(mtcars$cyl)
mtcars$vs <- as.factor(mtcars$vs)
mtcars$am <- as.factor(mtcars$am)
mtcars$gear <- as.factor(mtcars$gear)
mtcars$carb <- as.factor(mtcars$carb)

shinyServer(function(input, output) {
  
  formulaText <- reactive({
    paste("mpg ~", input$variable)
  })
  
  formulaTextPoint <- reactive({
    var <- ifelse(input$variable == "Number of Cylinders", "cyl", 
                  ifelse(input$variable == "Type of Engine", "vs",
                         ifelse(input$variable == "Type of Transmission", "am", 
                                ifelse(input$variable == "Number of Forward Gears", "gear", "carb"))))
    paste("mpg ~ ", var)
  })
  
  formulaVariableText <- reactive({
    var <- ifelse(input$variable == "Number of Cylinders", "cyl", 
                  ifelse(input$variable == "Type of Engine", "vs",
                         ifelse(input$variable == "Type of Transmission", "am", 
                                ifelse(input$variable == "Number of Forward Gears", "gear", "carb"))))
    paste(var)
  })
  
  output$boxplot <- renderPlot({
    gf_boxplot(as.formula(formulaText()), 
               data = mtcars,
               fill = "steelblue",
               notch = input$names)
  })
  
  output$barchart <- renderPlot({
    ggplot(mtcars, aes(eval(parse(text = formulaVariableText())))) +
      geom_bar(stat = "count", width = 0.7, fill = "steelblue") +
      labs(x = "", y = "")
  })
  
})