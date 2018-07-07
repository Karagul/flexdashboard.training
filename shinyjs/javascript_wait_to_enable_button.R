# NOT WORKING

# https://stackoverflow.com/a/43944758/5270873
# button not showing change of status or colors

library(shiny)

js <- "
$(document).ready(function() {
  $('#distPlot').on('shiny:recalculating', function() {
    $('button').prop('disabled', true);
    $('button').css('color', 'red');
  });
  $('#distPlot').on('shiny:recalculated', function() {
    $('button').prop('disabled', false);
    $('button').css('color', 'black');
});
});
"

server <- function(input, output) {

  output$distPlot <- renderPlot({
    hist(rnorm(input$obs), col = 'darkgray', border = 'white')
  })
}

ui <- fluidPage(
  tags$head(tags$script(HTML(js))),
  sidebarLayout(
    sidebarPanel(
      sliderInput("obs", "Number of observations:", min = 10000, max = 100000, value = 20000),
      actionButton("button", "OK!")
    ),
    mainPanel(plotOutput("distPlot"))
  )
)

shinyApp(ui = ui, server = server)