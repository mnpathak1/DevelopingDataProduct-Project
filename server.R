
library(shiny) 

BMI<-function(weight,height) {round(weight/(height^2),1)}

BMI_function<-function(weight,height){
    BMI_value<-weight/(height^2)
    ifelse(BMI_value<18.5,"underweight, go eat something!",
           ifelse(BMI_value<25,"normal weight, keep eating what you are eating!",
                  ifelse(BMI_value<30,"overweight, stop watching tv and run!!","obesity")))
}

shinyServer(
    function(input, output) {
        
        output$inputweightvalue <- renderPrint({input$weight})
        output$inputheightvalue <- renderPrint({input$height})
        output$estimation <- renderPrint({BMI(input$weight,input$height)})
        output$diagnostic <- renderPrint({BMI_function(input$weight,input$height)})
    } 
)