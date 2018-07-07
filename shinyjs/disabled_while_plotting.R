library(shiny)
library(shinyjs)

server <- function(input, output) {
    
    PlotData <- eventReactive(input$button,{
        disable("button") 
        Sys.sleep(2)
        hist(rnorm(input$obs), col = 'darkgray', border = 'white')
        enable("button") 
    })
    
    output$distPlot <- renderPlot({
        PlotData()
    })
}

ui <- fluidPage(
    shinyjs::useShinyjs(),
    sidebarLayout(
        sidebarPanel(
            sliderInput("obs", "Number of observations:", min = 10, max = 1000, value = 2000),
            actionButton("button", "OK!")
        ),
        mainPanel(plotOutput("distPlot"))
    )
)

shinyApp(ui = ui, server = server)