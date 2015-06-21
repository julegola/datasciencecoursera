library(shiny)
shinyUI(
  pageWithSidebar(
    # Title of Application
    headerPanel("Fibonacci Sequence"),
    
    sidebarPanel(
      numericInput('n', "Whole Number", 10),
      submitButton('Submit')
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Fibonacci", 
                 h3('Fibonacci Number'),
                 h4('You entered'),
                 verbatimTextOutput("inputValue"),
                 h4('The corresponding Fibonacci Number is '),
                 verbatimTextOutput("fibonacci")), 
        tabPanel("Documentation", 
                 h3('Documentation'),
                 verbatimTextOutput("documentation")
        )
      )
    )
  )
)