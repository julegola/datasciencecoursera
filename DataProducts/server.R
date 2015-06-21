## Function fib takes one argument, which has to be a whole number > 0 
## and calculates the corresponding number in the Fibonacci Sequence.
## The Fibonacci Sequence is defined as follows:
## 1. The first two Fibonacci numbers are both equal to 1. fib(1) = 1, fib(2) = 1
## 2. For n > 2, fib(n) = fib(n-1) + fib(n-2), 
## so fib(3) = 1 + 1 = 2, fib(4) = fib(3) + fib(2) = 2 + 1 = 3, etc.. 
## The first 10 Fibonaccis are: 1, 1, 2, 3, 5, 8, 13, 21, 34, 55

fib <- function(n) {
  ## First we check if the input is a whole number > 0, if not the function will stop.
  if  (!(is.numeric(n) & all.equal(n, as.integer(n)) & n > 0)) 
    stop("Invalid input")
  
  ## Initiating variables for the following loop to remember already calculated values 
  prev <- 1
  nex <- 1
  
  if (n < 3) res <- 1
  else 
    # Calculate the asked Fibonacci iterativ
    for (i in 2:(n-1)){
      res <- prev + nex
      prev <- nex
      nex <- res
    }
  ## output
  res
}

documentation <- 
'This application takes one argument, which has to be a whole number > 0 
and calculates the corresponding number in the Fibonacci Sequence.
The Fibonacci Sequence is defined as follows:

1. The first two Fibonacci numbers are both equal to 1:   F(1) = 1 and  F(2) = 1
2. For n > 2, F(n) is the sum of the two previous numbers in the sequence

So F(3) = F(2) + F(1) = 1 + 1 = 2, F(4) = 2 + 1 = 3, etc..

The first 10 Fibonaccis are: 1, 1, 2, 3, 5, 8, 13, 21, 34, 55'

shinyServer(
  function(input, output) {
    output$inputValue <- renderPrint({input$n})
    output$fibonacci <- renderPrint({fib(input$n)})
    output$documentation <- renderText({documentation})
  }
)