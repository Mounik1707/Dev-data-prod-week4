#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(
    navbarPage("Shiny Application",
               fluidPage(
                   titlePanel("Characteristics of car vs MPG"),
                   sidebarLayout(
                       sidebarPanel(
                           selectInput("variable", "Variable:",
                                       c("cylinders" = "cyl",
                                         "Displacement" = "disp",
                                         "horsepower" = "hp",
                                         "Rear axle ratio" = "drat",
                                         "Weight" = "wt",
                                         "1/4 mile time" = "qsec",
                                         "V/S" = "vs",
                                         "Transmission" = "am",
                                         "gears" = "gear",
                                         "carburetors" = "carb"
                                       )),
                           
                           checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
                       ),
                       
                       mainPanel(
                           h3(textOutput("caption")),
                           
                           tabsetPanel(type = "tabs", 
                                       tabPanel("BoxPlot", plotOutput("mpgBoxPlot")),
                                       tabPanel("Regression model", 
                                                plotOutput("mpgPlot"),
                                                verbatimTextOutput("fit")
                                       )
                           )
                       )
                   )
               )
    ))
