library(shiny)
library(ggplot2)
library(graphics)

shinyServer(function(input, output) {
  var1 <- reactive(function() {
    input$var1
  })
  var2 <- reactive(function() {
    input$var2
  })
  
  output$oVar1 <- renderPrint({input$var1})
  output$oVar2 <- renderPrint({input$var2})
  
  output$plot <- reactivePlot(function() {
    if(var1() == "City") {
      if(var2() == "Car Class") {
        p <- ggplot(mpg, aes(reorder(class, -cty, median), cty)) +
          ggtitle("Miles per gallon consumption for Class/City") +
          theme(plot.title = element_text(lineheight=.8)) +
          geom_boxplot(fill = "grey80") +
          coord_flip() + scale_x_discrete("Car Class") + ylab("City MPG")
      }
      else {
        p <- ggplot(mpg, aes(reorder(manufacturer, -cty, median), cty)) +
          ggtitle("Miles per gallon consumption for Manufacturer/City") +
          theme(plot.title = element_text(lineheight=.8)) +
          geom_boxplot(fill = "grey80") +
          coord_flip() + scale_x_discrete("Car Manufacturer") + ylab("City MPG")
      }
    }
    if(var1() == "Highway") {
      if(var2() == "Car Class") {
        p <- ggplot(mpg, aes(reorder(class, -hwy, median), hwy)) +
          ggtitle("Miles per gallon consumption for Class/Highway") +
          theme(plot.title = element_text(lineheight=.8)) +
          geom_boxplot(fill = "grey80") +
          coord_flip() + scale_x_discrete("Car Class") + ylab("Highway MPG")
      }
      else {
        p <- ggplot(mpg, aes(reorder(manufacturer, -hwy, median), hwy)) +
          ggtitle("Miles per gallon consumption for Manufacturer/Highway") +
          theme(plot.title = element_text(lineheight=.8)) +
          geom_boxplot(fill = "grey80") +
          coord_flip() + scale_x_discrete("Car Manufacturer") + ylab("Highway MPG")
      }
    }
    print(p)
  })
})