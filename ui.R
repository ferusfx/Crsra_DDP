library(shiny)
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  titlePanel("Miles per gallon consumption City/Highway"),
  sidebarLayout(
    sidebarPanel(
      helpText("Select a category to create a plot of the fuel economy from the mpg dataset (ggplot2 package)."),
      selectInput("var1",
                  label = "Choose between City/Highway",
                  choices = c("City", "Highway"),
                  selected = "City"),
      selectInput("var2",
                  label = "Choose between Car Class/ Car Manufacturer",
                  choices = c("Car Class", "Car MPG"),
                  selected = "Car Class")
    ),
    mainPanel(
      h4('Input Data1'),
      verbatimTextOutput("oVar1"),
      h4('Input Data2'),
      verbatimTextOutput("oVar2"),
      plotOutput("plot", width="800px", height="600px")
    )
  )
))