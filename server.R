library(shiny)

plotRect <- function (range, f, numrect, type=c('Left-Hand Sum', 'Right-Hand Sum')){
    lh = min(range)
    rh = max(range)
    delta = (rh-lh)/numrect
    newrange = seq(lh, rh, .001)
    plot(newrange, f(newrange), type='l', lwd=3, col='red', yaxs='i', xaxs='i',
         xlab='x', ylab='f(x)')
    
    for (i in 1:numrect){
        # Set x and y values
        left <- lh + (i-1) * delta
        right <- lh + i * delta
        x <- seq(left, left + delta, .001)
        if (type=='Left-Hand Sum') height=f(left)
        else if (type=='Right-Hand Sum') height=f(right)
        # Draw the tops of the rectangles
        points(x, rep(height, length=length(x)), type='l', col='blue', lwd=2)
        # Draw the vertical edges
        points(c(left, left), c(0, height),type='l', col='blue', lwd=2)
        points(c(right, right), c(0, height),type='l', col='blue', lwd=2)
    }
    recordPlot()
}

shinyServer(
    function(input,output){
        output$f <- renderText( {if ({input$f}=="y=1/x^2") "y = 1 / x^2"
                                 else "y = x^2"} )
        output$numrect <- renderText({input$numrect})
        output$type <- renderText({input$which})

        output$plot <- renderPlot(plotRect(1:10, 
                                 { if ({input$f}=="y=x^2") function(x){x^2}
                                     else function(x){1/x^2}}, 
                                input$numrect, 
                                 input$which))
    }
)


