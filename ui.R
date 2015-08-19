library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Visualization of Approximations to Integrals"),
    sidebarPanel(
        h3("Input"),
        sliderInput(inputId='numrect', label='Number of Rectangles', 
                    min=1, max=100, value=10),
        selectInput(inputId='f', label='Function', 
                    choices=c("y=1/x^2", "y=x^2")),
        selectInput(inputId='which', label='Type of Approximation', 
                    choices=c("Left-Hand Sum", "Right-Hand Sum"))),
    mainPanel(
        h3("Main panel"),
        p(),
        "For a non-negative function f, the integral of f(x) from x=a to x=b is equal to the area between f(x) and the x-axis.",
        "We can approximate this area with rectangles. As we increase the number of rectangles, the area covered by the rectangles gets closer and closer to the actual area we seek.",
        p(),
        "The area covered by the rectangles may be too large or too small, depending on (1) whether the function is increasing or decreasing",
        "and (2) whether the height of each rectangle is the value of the function at the left or right endpoint of the base of that rectangle.",
        br(),
        br(),
        "Function: ",
        textOutput('f'),
        br(),
        "Number of rectangles:",
        textOutput('numrect'),
        br(),
        "Type of sum:",
        textOutput('type'),
        br(),
        plotOutput('plot')
    )
))

# Need to pick:
# Function (1/x^2 or x^2)
# left or right hand sum
# # rectangles