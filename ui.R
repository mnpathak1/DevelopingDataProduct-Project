
library(shiny) 
shinyUI(
    pageWithSidebar(
        # Application title
        headerPanel("Body Mass Index (BMI) Calculator"),
        
        sidebarPanel(
            numericInput('weight', 'Insert your weight in kilograms', 70) ,
            numericInput('height', 'Insert your height in metres', 1.70, min = 0.2, 
                         max = 3, step = 0.01),
            submitButton('Submit')
        ), 
        mainPanel(
            p('The Body mass index (BMI) is a quantitative health metric, defined as: 
              weight (kg)/height (m)^2.'),
            p('World Health Organization (WHO) BMI classification:'),
            tags$div(
                tags$ul(
                    tags$li('BMI <18.5       : Underweight'),
                    tags$li('BMI [18.5-24.9] : Normal weight'),
                    tags$li('BMI [25-29.9]   : Overweight'),
                    tags$li('BMI >=30        : Obesity')
                )
            ),
            
            h4('You entered:'), 
            p('weight:'), verbatimTextOutput("inputweightvalue"),
            p('height:'), verbatimTextOutput("inputheightvalue"),
            h4('Your BMI is:'),
            verbatimTextOutput("estimation"),
            h4('Means you are:'),strong(verbatimTextOutput("diagnostic"))
            
            
        )
        
    )   
)