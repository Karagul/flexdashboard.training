# https://stackoverflow.com/a/48205785/5270873

library(shiny)
library(shinyjs)

ui <- shinyUI({
    shiny::fluidPage(
        useShinyjs(),  # Set up shinyjs
        actionButton(inputId = "start", label = "start")
    )
})

server <- shinyServer(function(input, output){
    actionFunction = function(){
        shinyjs::hide("start", animType = "fade", time = 5)
        
        # Replace actual code instead
        withProgress(message = 'Calculation in progress',
                     detail = 'This may take a while...', value = 0, {
                         for (i in 1:15) {
                             incProgress(1/15)
                             Sys.sleep(0.25)
                         }
                     })
        
        shinyjs::show("start", animType = "slide", time = 1)
    }
    
    # Run action function on button click  
    onclick("start", actionFunction())
})

shinyApp(ui,server)