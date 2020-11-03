library(shiny)
library(datasets)

mpgData <- mtcars
mpgData$am <- factor(mpgData$am, labels = c("Auto_trans", "Man_trans"))

shinyServer(function(input, output) 
{
formulaText<-reactive( {paste("mpg ~", input$variable)} )
    
formulaTextPoint<-reactive( {paste("mpg ~", input$variable)} )
    
fit<-reactive( {lm(as.formula(formulaTextPoint()), data=mpgData)} )

output$caption<-renderText( {formulaText()} )

output$mpgBoxPlot<-renderPlot( {boxplot(as.formula(formulaText()), data = mpgData, outline = input$outliers)} )
    
output$fit<-renderPrint( {summary(fit())} )
output$mpgPlot<-renderPlot( {with(mpgData, {
    plot(as.formula(formulaTextPoint())) 
    abline(fit(), col=3)} )} )
}
)
