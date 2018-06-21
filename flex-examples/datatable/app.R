# An app with a datatable whose pagination option we can toggle with a button
library(shiny)
runApp(list(
    ui = fluidPage(
        sidebarLayout(
            sidebarPanel(
                checkboxInput("paging", "Paginate table")
            ),
            mainPanel(
                DT::dataTableOutput("table")
            )
        )
    ),
    server = function(input, output) {
        # Create a new table when input$paging changes
        makeTable <- reactive({
            DT::datatable(
                { data.frame(x= 1:100, y = input$paging)},   # Some dummy data
                options= list(
                    paging = input$paging
                )
            )
        })
        # Render the datatable returned by the reactive function
        output$table <- DT::renderDataTable( makeTable() )
    }
))