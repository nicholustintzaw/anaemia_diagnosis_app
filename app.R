#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(nutricheckr)


# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Please enter your Hb value of children U5 "),

    # Numerical input
    numericInput("hb", "U5 hb value",
                 value = 0,
                 min = 0, max = 200),

    # adding calculate tab
    actionButton("def_anaemia", "Calculate", icon = icon("calculator",
                                                         lib = "font-awesome")),

    # Show the anaemia status
    mainPanel(
       textOutput("u5_anaemia")
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    observeEvent(input$def_anaemia, {

        req(input$hb != 0)

        x <- (as.character(name_anaemia_u5(input$hb)))

        u5_result <- paste0("this u5 child anaemia status is ", x)

        output$u5_anaemia <- renderText({
            u5_result
        })

    })
}

# Run the application
shinyApp(ui = ui, server = server)

