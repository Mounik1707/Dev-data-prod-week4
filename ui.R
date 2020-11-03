library(shiny)

shinyUI(
navbarPage("Shiny Application",
  fluidPage(titlePanel("Properties of cars & MPG"), sidebarLayout(sidebarPanel(selectInput("variable", "Parameters-",
   c("!No_of_Cylinders!" = "cyl", "!Displacement_Volume!" = "disp", "!Horse_Power!" = "hp", "!R_Axle_Rat!" = "drat",
     "!Mass!" = "wt", "!Time_Qtr_Mile!" = "qsec", "!V/S!" = "vs", "!Trans!" = "am", "!No_Of_Gears!" = "gear",
    "!Carburetor_s!" = "carb" )
   ),
  checkboxInput("outliers", "Display_BoxPlot_Outs", FALSE)
  ),
                       
mainPanel(h3(textOutput("caption")),
    tabsetPanel(type = "tabs",tabPanel("Box_Plot", plotOutput("mpgBoxPlot")), tabPanel("Regr_Mod", plotOutput("mpgPlot"),
                verbatimTextOutput("fit")) )
                           
          )
        )
      )
    )
  )
